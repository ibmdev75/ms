<%@page import="com.jalios.io.*"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
if (!isAdmin) {
  return;
}

File photoDir = new File(channel.getUploadPath("photos"));

logger.info("photoDir: " + photoDir);
List<File> photoList = IOUtil.deepListFiles(photoDir, new RegexpFileFilter("(?i).*mbr_.*\\.((jpg)|(jpeg)|(png))$"), false);
if (Util.isEmpty(photoList)) {
  return;
}
for(File photo: photoList) {
  if (FileDocument.isThumbnail(photo)) {
    continue;
  }

  File cropped = ImageUtil.cropSquare(photo, null, null);
  if (cropped == null) {
    logger.info("Skip photo " + photo);
  } else {
    IOUtil.moveFile(cropped, photo);
    logger.info("Crop photo " + photo);
  }
  
  // Delete associated dir
  File associatedDir = new File(photo + ".associated");
  if (associatedDir.exists()) {
    IOUtil.deepDelete(associatedDir);
    logger.info("Delete associated dir " + associatedDir);
  }

}
%>

