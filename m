From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 4/9] leds: 88pm860x: add missing of_node_put
Date: Sat, 24 Oct 2015 16:42:30 +0200
Message-ID: <1445697755-26341-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-leds@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression e,r;
@@

 for_each_child_of_node(r,n) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  break;
)
   ...
 }
... when != n
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/leds/leds-88pm860x.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1497a09..7870840 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -142,6 +142,7 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 			of_property_read_u32(np, "marvell,88pm860x-iset",
 					     &iset);
 			data->iset = PM8606_LED_CURRENT(iset);
+			of_node_put(np);
 			break;
 		}
 	}

