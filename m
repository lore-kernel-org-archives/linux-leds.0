From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 1/9] powerpc/powernv: add missing of_node_put
Date: Sat, 24 Oct 2015 16:42:27 +0200
Message-ID: <1445697755-26341-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-leds@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/leds/leds-powernv.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 2c5c5b1..1e75e1f 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -262,15 +262,19 @@ static int powernv_led_classdev(struct platform_device *pdev,
 		while ((cur = of_prop_next_string(p, cur)) != NULL) {
 			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
 						   GFP_KERNEL);
-			if (!powernv_led)
+			if (!powernv_led) {
+				of_node_put(np);
 				return -ENOMEM;
+			}
 
 			powernv_led->common = powernv_led_common;
 			powernv_led->loc_code = (char *)np->name;
 
 			rc = powernv_led_create(dev, powernv_led, cur);
-			if (rc)
+			if (rc) {
+				of_node_put(np);
 				return rc;
+			}
 		} /* while end */
 	}
 
