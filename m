From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 4/4] mtd: Hook I/O activity to the MTD LED trigger
Date: Tue, 12 Apr 2016 17:46:42 -0300
Message-ID: <1460494002-8578-5-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: linux-leds@vger.kernel.org

Now that we've added the MTD LED trigger, we need
to call each I/O path to ledtrig_mtd_activity.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/mtdcore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 99d83f3331b0..bee180bd11e7 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/kconfig.h>
+#include <linux/leds.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -862,6 +863,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		mtd_erase_callback(instr);
 		return 0;
 	}
+	ledtrig_mtd_activity();
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -925,6 +927,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	if (!len)
 		return 0;
 
+	ledtrig_mtd_activity();
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
@@ -949,6 +952,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	ledtrig_mtd_activity();
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
@@ -982,6 +986,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
+
+	ledtrig_mtd_activity();
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
 	 * similar to mtd->_read(), returning a non-negative integer
@@ -1005,6 +1011,7 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EOPNOTSUPP;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	ledtrig_mtd_activity();
 	return mtd->_write_oob(mtd, to, ops);
 }
 EXPORT_SYMBOL_GPL(mtd_write_oob);
-- 
2.7.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
