From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 2/9] leds: bcm6358: add missing of_node_put
Date: Sat, 24 Oct 2015 16:42:28 +0200
Message-ID: <1445697755-26341-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-leds@vger.kernel.org

for_each_available_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_available_child_of_node(root, child) {
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
 drivers/leds/leds-bcm6358.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 7ea3526..82b4ee1 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -215,8 +215,10 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 		}
 
 		rc = bcm6358_led(dev, child, reg, mem, lock);
-		if (rc < 0)
+		if (rc < 0) {
+			of_node_put(child);
 			return rc;
+		}
 	}
 
 	return 0;
