From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 1/2] mtd: Uninline mtd_write_oob and move it to mtdcore.c
Date: Tue, 12 Apr 2016 13:26:34 -0300
Message-ID: <1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:35071 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757117AbcDLQaB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 12:30:01 -0400
Received: by mail-qg0-f46.google.com with SMTP id f105so20375631qge.2
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 09:30:01 -0700 (PDT)
In-Reply-To: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

There's no reason for having mtd_write_oob inlined in mtd.h header.
Move it to mtdcore.c where it belongs.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/mtdcore.c   | 12 ++++++++++++
 include/linux/mtd/mtd.h | 12 +-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 309625130b21..99d83f3331b0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -997,6 +997,18 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 }
 EXPORT_SYMBOL_GPL(mtd_read_oob);
 
+int mtd_write_oob(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
+{
+	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->_write_oob)
+		return -EOPNOTSUPP;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	return mtd->_write_oob(mtd, to, ops);
+}
+EXPORT_SYMBOL_GPL(mtd_write_oob);
+
 /*
  * Method to access the protection register area, present in some flash
  * devices. The user data is one time programmable but the factory data is read
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 771272187316..ef9fea4fc400 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -283,17 +283,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		    const u_char *buf);
 
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
-
-static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
-				struct mtd_oob_ops *ops)
-{
-	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_write_oob)
-		return -EOPNOTSUPP;
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-	return mtd->_write_oob(mtd, to, ops);
-}
+int mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops);
 
 int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
 			   struct otp_info *buf);
-- 
2.7.0
