From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] leds: tlc591xx: add missing of_node_put
Date: Sat, 15 Jul 2017 09:48:53 +0200
Message-ID: <1500104933-25286-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so a
return from the loop requires an of_node_put.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression e,e1;
iterator name for_each_child_of_node;
@@

 for_each_child_of_node(e1,n) {
   ...
(
   of_node_put(n);
|
   e = n
|
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/leds/leds-tlc591xx.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff -u -p a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -230,12 +230,18 @@ tlc591xx_probe(struct i2c_client *client
 
 	for_each_child_of_node(np, child) {
 		err = of_property_read_u32(child, "reg", &reg);
-		if (err)
+		if (err) {
+			of_node_put(child);
 			return err;
-		if (reg < 0 || reg >= tlc591xx->max_leds)
+		}
+		if (reg < 0 || reg >= tlc591xx->max_leds) {
+			of_node_put(child);
 			return -EINVAL;
-		if (priv->leds[reg].active)
+		}
+		if (priv->leds[reg].active) {
+			of_node_put(child);
 			return -EINVAL;
+		}
 		priv->leds[reg].active = true;
 		priv->leds[reg].ldev.name =
 			of_get_property(child, "label", NULL) ? : child->name;

