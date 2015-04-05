package custom;

import generated.FaqEntry;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import com.jalios.jcms.JcmsUtil;
import com.jalios.util.Util;

public class CustomEditFaqEntryHandler extends generated.EditFaqEntryHandler {

  protected boolean opUp;
  protected boolean opDown;
  
  FaqEntry getFaqEntry() {
    return (FaqEntry) getPublication();
  }

  @Override
  public boolean processAction() throws java.io.IOException {
    if (super.processAction()) {
      return true;
    }
    
    if (validateUp()) {
      return performUp();
    }
    
    if (validateDown()) {
      return performDown();
    }
    
    return false;
  }
  
  // ----------------------------------------------------------------------
  // Up
  // ----------------------------------------------------------------------
  boolean validateUp() {
    if (!opUp) {
      return false;
    }
    
    // Check if entry is not null
    if (getFaqEntry() == null) {
      setWarningMsg(glp("msg.faq-entry-editor.bad-faq-entry-id", id));
      return false;
    }

    return true;
  }

  boolean performUp() throws java.io.IOException {
    TreeSet set = new TreeSet(new OrderComparator());
    set.addAll(getFaqEntry().getFaq().getLinkIndexedDataSet(FaqEntry.class));
    
    // Clean the current order
    FaqEntry swapEntry = null;
    FaqEntry prevEntry = null;
    int i = 0;
    for(Iterator it = set.iterator(); it.hasNext(); i++) {
      FaqEntry itEntry = (FaqEntry)it.next();
      if (itEntry.getOrder() != i) {
        FaqEntry updated = new FaqEntry(itEntry);
        updated.setOrder(i);
        updated.performUpdate(loggedMember);
      }
      if (itEntry == getFaqEntry()) {
        swapEntry = prevEntry;
      }
      prevEntry = itEntry;
    }
    
    // Perform a swap
    if (swapEntry != null) {
      int order = getFaqEntry().getOrder();
      
      FaqEntry updated = new FaqEntry(getFaqEntry());
      updated.setOrder(swapEntry.getOrder());
      updated.performUpdate(loggedMember);
      
      updated = new FaqEntry(swapEntry);
      updated.setOrder(order);
      updated.performUpdate(loggedMember);
    }
    // Perform a roll-up
    else {
      for(Iterator it = set.iterator(); it.hasNext(); i++) {
        FaqEntry itEntry = (FaqEntry)it.next();
        FaqEntry updated = new FaqEntry(itEntry);
        if (itEntry.getOrder() == 0) {
          updated.setOrder(set.size() - 1);
        } else {
          updated.setOrder(itEntry.getOrder() - 1);
        }
        updated.performUpdate(loggedMember);
      }
    }
    
    if (Util.isEmpty(redirect)) {
      redirect = JcmsUtil.getDisplayUrl(getFaqEntry().getFaq(), userLocale);
    }
    sendRedirect(redirect);
    return true;
  }

  // ----------------------------------------------------------------------
  // Down
  // ----------------------------------------------------------------------
   boolean validateDown() {
    if (!opDown) {
      return false;
    }

    // Check if entry is not null
    if (getFaqEntry() == null) {
      setWarningMsg(glp("msg.faq-entry-editor.bad-faq-entry-id", id));
      return false;
    }
    
    return true;
   }
  
  boolean performDown() throws java.io.IOException {
    TreeSet set = new TreeSet(new OrderComparator());
    set.addAll(getFaqEntry().getFaq().getLinkIndexedDataSet(FaqEntry.class));
    
    // Clean the current order
    FaqEntry swapEntry = null;
    boolean getNext = false;
    int i = 0;
    for(Iterator it = set.iterator(); it.hasNext(); i++) {
      FaqEntry itEntry = (FaqEntry)it.next();
      if (itEntry.getOrder() != i) {
        FaqEntry updated = new FaqEntry(itEntry);
        updated.setOrder(i);
        updated.performUpdate(loggedMember);
      }
      if (getNext) {
        swapEntry = itEntry;
        getNext = false;
      }
      if (itEntry == getFaqEntry()) {
        getNext = true;
      }
    }
    
    // Perform a swap
    if (swapEntry != null) {
      int order = getFaqEntry().getOrder();
      
      FaqEntry updated = new FaqEntry(getFaqEntry());
      updated.setOrder(swapEntry.getOrder());
      updated.performUpdate(loggedMember);
      
      updated = new FaqEntry(swapEntry);
      updated.setOrder(order);
      updated.performUpdate(loggedMember);
    }
    // Perform a roll-down
    else {
      int lastOrder = set.size() - 1;
      for(Iterator it = set.iterator(); it.hasNext(); i++) {
        FaqEntry itEntry = (FaqEntry)it.next();
        FaqEntry updated = new FaqEntry(itEntry);
        if (itEntry.getOrder() == lastOrder) {
          updated.setOrder(0);
        } else {
          updated.setOrder(itEntry.getOrder() + 1);
        }
        updated.performUpdate(loggedMember);
      }
    }
    
    if (redirect.length() == 0) {
      redirect = JcmsUtil.getDisplayUrl(getFaqEntry().getFaq(), userLocale);
    }
    sendRedirect(redirect);
    return true;
  }



  // ----------------------------------------------------------------------
  // getter/setter
  // ----------------------------------------------------------------------
 
  public void setOpUp(String  v) {
    op = true;
    opUp = true;
  }
  
  public void setOpDown(String  v) {
    op = true;
    opDown = true;
  }

  private int getNextOrder(int proposedOrder) {
    if (faq == null) {
      return proposedOrder;
    }
    Set entrySet = faq.getLinkIndexedDataSet(FaqEntry.class);
    if (Util.isEmpty(entrySet)) {
      return proposedOrder;
    }
    
    // Find out the the last entry
    TreeSet sortedSet = new TreeSet(new OrderComparator());
    sortedSet.addAll(entrySet);
    FaqEntry lastEntry = (FaqEntry)sortedSet.last();
    
    // Next order = last order + 1
    return lastEntry.getOrder() + 1;
  }
  
  @Override
  public int getAvailableOrder() {
    int proposedOrder = super.getAvailableOrder();
    if (proposedOrder == 0 && getFaqEntry() == null) {
      proposedOrder = getNextOrder(proposedOrder);
    }
    return proposedOrder;
  }
  
  public static class OrderComparator extends com.jalios.jstore.BasicStorable.CdateComparator<FaqEntry> {
    @Override
    public int compare(FaqEntry f1, FaqEntry f2) {
      
      if (f1 == null) {
	if (f2 == null) {
	  return 0;
	}
	return -1;
      }
      
      if (f2 == null) {
	return 1;
      }
      
      int res = f1.getOrder() - f2.getOrder();
      if (res != 0)
	return res;
      return -super.compare(f1, f2); // :NOTE: The result is negated 
    }
  }



}
