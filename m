From: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
Subject: [RFC PATCH 3/3] can: make use of ledtrig-activity
Date: Tue,  6 Sep 2016 14:10:48 +0200
Message-ID: <1473163848-5408-4-git-send-email-tobias.doerffel@ed-chemnitz.de>
References: <1473163848-5408-1-git-send-email-tobias.doerffel@ed-chemnitz.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from dd13524.kasserver.com ([85.13.135.100]:50650 "EHLO
        dd13524.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755949AbcIFMRs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Sep 2016 08:17:48 -0400
In-Reply-To: <1473163848-5408-1-git-send-email-tobias.doerffel@ed-chemnitz.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>

Instead of registering and controlling activity LEDs individually use
the new activity LED trigger.

Signed-off-by: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
---
 drivers/net/can/led.c   | 58 ++++++++++---------------------------------------
 include/linux/can/dev.h |  7 +-----
 include/linux/can/led.h |  2 --
 3 files changed, 12 insertions(+), 55 deletions(-)

diff --git a/drivers/net/can/led.c b/drivers/net/can/led.c
index c1b6676..cd2b99c 100644
--- a/drivers/net/can/led.c
+++ b/drivers/net/can/led.c
@@ -25,33 +25,20 @@ MODULE_PARM_DESC(led_delay,
 void can_led_event(struct net_device *netdev, enum can_led_event event)
 {
 	struct can_priv *priv = netdev_priv(netdev);
+	struct activity_led_trigger *trig = priv->activity_led_trig;
 
 	switch (event) {
 	case CAN_LED_EVENT_OPEN:
-		led_trigger_event(priv->tx_led_trig, LED_FULL);
-		led_trigger_event(priv->rx_led_trig, LED_FULL);
-		led_trigger_event(priv->rxtx_led_trig, LED_FULL);
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_START);
 		break;
 	case CAN_LED_EVENT_STOP:
-		led_trigger_event(priv->tx_led_trig, LED_OFF);
-		led_trigger_event(priv->rx_led_trig, LED_OFF);
-		led_trigger_event(priv->rxtx_led_trig, LED_OFF);
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_STOP);
 		break;
 	case CAN_LED_EVENT_TX:
-		if (led_delay) {
-			led_trigger_blink_oneshot(priv->tx_led_trig,
-						  &led_delay, &led_delay, 1);
-			led_trigger_blink_oneshot(priv->rxtx_led_trig,
-						  &led_delay, &led_delay, 1);
-		}
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_TX);
 		break;
 	case CAN_LED_EVENT_RX:
-		if (led_delay) {
-			led_trigger_blink_oneshot(priv->rx_led_trig,
-						  &led_delay, &led_delay, 1);
-			led_trigger_blink_oneshot(priv->rxtx_led_trig,
-						  &led_delay, &led_delay, 1);
-		}
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_RX);
 		break;
 	}
 }
@@ -61,9 +48,7 @@ static void can_led_release(struct device *gendev, void *res)
 {
 	struct can_priv *priv = netdev_priv(to_net_dev(gendev));
 
-	led_trigger_unregister_simple(priv->tx_led_trig);
-	led_trigger_unregister_simple(priv->rx_led_trig);
-	led_trigger_unregister_simple(priv->rxtx_led_trig);
+	ledtrig_activity_unregister(priv->activity_led_trig);
 }
 
 /* Register CAN LED triggers for a CAN device
@@ -81,19 +66,9 @@ void devm_can_led_init(struct net_device *netdev)
 		return;
 	}
 
-	snprintf(priv->tx_led_trig_name, sizeof(priv->tx_led_trig_name),
-		 "%s-tx", netdev->name);
-	snprintf(priv->rx_led_trig_name, sizeof(priv->rx_led_trig_name),
-		 "%s-rx", netdev->name);
-	snprintf(priv->rxtx_led_trig_name, sizeof(priv->rxtx_led_trig_name),
-		 "%s-rxtx", netdev->name);
-
-	led_trigger_register_simple(priv->tx_led_trig_name,
-				    &priv->tx_led_trig);
-	led_trigger_register_simple(priv->rx_led_trig_name,
-				    &priv->rx_led_trig);
-	led_trigger_register_simple(priv->rxtx_led_trig_name,
-				    &priv->rxtx_led_trig);
+	ledtrig_activity_register(netdev->name, ACTIVITY_LEDS_RX |
+				  ACTIVITY_LEDS_TX | ACTIVITY_LEDS_RXTX,
+				  &priv->activity_led_trig);
 
 	devres_add(&netdev->dev, res);
 }
@@ -105,23 +80,12 @@ static int can_led_notifier(struct notifier_block *nb, unsigned long msg,
 {
 	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
 	struct can_priv *priv = safe_candev_priv(netdev);
-	char name[CAN_LED_NAME_SZ];
-
-	if (!priv)
-		return NOTIFY_DONE;
 
-	if (!priv->tx_led_trig || !priv->rx_led_trig || !priv->rxtx_led_trig)
+	if (!priv || !priv->activity_led_trig)
 		return NOTIFY_DONE;
 
 	if (msg == NETDEV_CHANGENAME) {
-		snprintf(name, sizeof(name), "%s-tx", netdev->name);
-		led_trigger_rename_static(name, priv->tx_led_trig);
-
-		snprintf(name, sizeof(name), "%s-rx", netdev->name);
-		led_trigger_rename_static(name, priv->rx_led_trig);
-
-		snprintf(name, sizeof(name), "%s-rxtx", netdev->name);
-		led_trigger_rename_static(name, priv->rxtx_led_trig);
+		ledtrig_activity_rename(netdev->name, priv->activity_led_trig);
 	}
 
 	return NOTIFY_DONE;
diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
index 5261751..f75e7a6 100644
--- a/include/linux/can/dev.h
+++ b/include/linux/can/dev.h
@@ -61,12 +61,7 @@ struct can_priv {
 	struct sk_buff **echo_skb;
 
 #ifdef CONFIG_CAN_LEDS
-	struct led_trigger *tx_led_trig;
-	char tx_led_trig_name[CAN_LED_NAME_SZ];
-	struct led_trigger *rx_led_trig;
-	char rx_led_trig_name[CAN_LED_NAME_SZ];
-	struct led_trigger *rxtx_led_trig;
-	char rxtx_led_trig_name[CAN_LED_NAME_SZ];
+	struct activity_led_trigger *activity_led_trig;
 #endif
 };
 
diff --git a/include/linux/can/led.h b/include/linux/can/led.h
index 2746f7c..96b58c0 100644
--- a/include/linux/can/led.h
+++ b/include/linux/can/led.h
@@ -25,8 +25,6 @@ enum can_led_event {
 /* keep space for interface name + "-tx"/"-rx"/"-rxtx"
  * suffix and null terminator
  */
-#define CAN_LED_NAME_SZ (IFNAMSIZ + 6)
-
 void can_led_event(struct net_device *netdev, enum can_led_event event);
 void devm_can_led_init(struct net_device *netdev);
 int __init can_led_notifier_init(void);
-- 
2.1.4
