From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v4 07/21] of: add of_node_ncmp wrapper
Date: Fri, 11 Jul 2014 16:04:10 +0200
Message-ID: <1405087464-13762-8-git-send-email-j.anaszewski@samsung.com>
References: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Grant Likely <grant.likely@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Simek <monstr@monstr.eu>
List-Id: linux-leds@vger.kernel.org

The wrapper for strnicmp is required for checking whether a node has
expected prefix.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michal Simek <monstr@monstr.eu>
---
 include/linux/of.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 692b56c..9a53eea 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -199,6 +199,7 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 #define of_compat_cmp(s1, s2, l)	strcasecmp((s1), (s2))
 #define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
+#define of_node_ncmp(s1, s2, n)		strnicmp((s1), (s2), (n))
 #endif
 
 /* flag descriptions */
-- 
1.7.9.5
