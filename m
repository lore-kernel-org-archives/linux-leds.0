From: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
Subject: [RFC PATCH 2/3] arcnet: make use of ledtrig-activity
Date: Tue,  6 Sep 2016 14:10:47 +0200
Message-ID: <1473163848-5408-3-git-send-email-tobias.doerffel@ed-chemnitz.de>
References: <1473163848-5408-1-git-send-email-tobias.doerffel@ed-chemnitz.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from dd13524.kasserver.com ([85.13.135.100]:50648 "EHLO
        dd13524.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755942AbcIFMRs (ORCPT
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
 drivers/net/arcnet/arcdevice.h |  7 +------
 drivers/net/arcnet/arcnet.c    | 34 +++++++++++++---------------------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/net/arcnet/arcdevice.h b/drivers/net/arcnet/arcdevice.h
index 20bfb9b..3ca76ec 100644
--- a/drivers/net/arcnet/arcdevice.h
+++ b/drivers/net/arcnet/arcdevice.h
@@ -237,8 +237,6 @@ struct Outgoing {
 		numsegs;	/* number of segments */
 };
 
-#define ARCNET_LED_NAME_SZ (IFNAMSIZ + 6)
-
 struct arcnet_local {
 	uint8_t config,		/* current value of CONFIG register */
 		timeout,	/* Extended timeout for COM20020 */
@@ -262,10 +260,7 @@ struct arcnet_local {
 	/* On preemtive and SMB a lock is needed */
 	spinlock_t lock;
 
-	struct led_trigger *tx_led_trig;
-	char tx_led_trig_name[ARCNET_LED_NAME_SZ];
-	struct led_trigger *recon_led_trig;
-	char recon_led_trig_name[ARCNET_LED_NAME_SZ];
+	struct activity_led_trigger *activity_led_trig;
 
 	struct timer_list	timer;
 
diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index 6ea963e..49b9061 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -195,25 +195,18 @@ static void arcnet_dump_packet(struct net_device *dev, int bufnum,
 void arcnet_led_event(struct net_device *dev, enum arcnet_led_event event)
 {
 	struct arcnet_local *lp = netdev_priv(dev);
-	unsigned long led_delay = 350;
-	unsigned long tx_delay = 50;
+	struct activity_led_trigger *trig = lp->activity_led_trig;
 
 	switch (event) {
 	case ARCNET_LED_EVENT_RECON:
-		led_trigger_blink_oneshot(lp->recon_led_trig,
-					  &led_delay, &led_delay, 0);
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_RECONNECT);
 		break;
 	case ARCNET_LED_EVENT_OPEN:
-		led_trigger_event(lp->tx_led_trig, LED_OFF);
-		led_trigger_event(lp->recon_led_trig, LED_OFF);
-		break;
 	case ARCNET_LED_EVENT_STOP:
-		led_trigger_event(lp->tx_led_trig, LED_OFF);
-		led_trigger_event(lp->recon_led_trig, LED_OFF);
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_STOP);
 		break;
 	case ARCNET_LED_EVENT_TX:
-		led_trigger_blink_oneshot(lp->tx_led_trig,
-					  &tx_delay, &tx_delay, 0);
+		ledtrig_activity_event(trig, ACTIVITY_LED_EVENT_TX);
 		break;
 	}
 }
@@ -223,8 +216,7 @@ static void arcnet_led_release(struct device *gendev, void *res)
 {
 	struct arcnet_local *lp = netdev_priv(to_net_dev(gendev));
 
-	led_trigger_unregister_simple(lp->tx_led_trig);
-	led_trigger_unregister_simple(lp->recon_led_trig);
+	ledtrig_activity_unregister(lp->activity_led_trig);
 }
 
 /* Register ARCNET LED triggers for a arcnet device
@@ -234,6 +226,7 @@ static void arcnet_led_release(struct device *gendev, void *res)
 void devm_arcnet_led_init(struct net_device *netdev, int index, int subid)
 {
 	struct arcnet_local *lp = netdev_priv(netdev);
+	char name[TRIG_NAME_MAX];
 	void *res;
 
 	res = devres_alloc(arcnet_led_release, 0, GFP_KERNEL);
@@ -242,15 +235,14 @@ void devm_arcnet_led_init(struct net_device *netdev, int index, int subid)
 		return;
 	}
 
-	snprintf(lp->tx_led_trig_name, sizeof(lp->tx_led_trig_name),
-		 "arc%d-%d-tx", index, subid);
-	snprintf(lp->recon_led_trig_name, sizeof(lp->recon_led_trig_name),
-		 "arc%d-%d-recon", index, subid);
+	snprintf(name, sizeof(name), "arc%d-%d", index, subid);
+
+	ledtrig_activity_register(name, ACTIVITY_LEDS_TX |
+				  ACTIVITY_LEDS_RECONNECT,
+				  &lp->activity_led_trig);
 
-	led_trigger_register_simple(lp->tx_led_trig_name,
-				    &lp->tx_led_trig);
-	led_trigger_register_simple(lp->recon_led_trig_name,
-				    &lp->recon_led_trig);
+	ledtrig_activity_set_delay(lp->activity_led_trig,
+				   ACTIVITY_LEDS_RECONNECT, 350);
 
 	devres_add(&netdev->dev, res);
 }
-- 
2.1.4
