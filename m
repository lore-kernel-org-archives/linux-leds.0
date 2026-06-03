Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF65351C26;
	Wed,  3 Jun 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450141; cv=none; b=urHtoAcPecCNxXYEdk7pDNxquaiOFH556UJGNJniBhfY43odtAGKIOnUj2tAjgJYCO5pvDQTNb8tJ4sBnjNYB7p2eAtGEOB7DDVqklHq+YpUY9cfoGDIN7/LEzBrxXDQa/vqLz1XRyBPJbCmfSwC/S3fi4CKH9PKp7iApPB84ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450141; c=relaxed/simple;
	bh=p61Lac/Pntz160REqqzoTPVBlenzEOGpU0J+KBZ+cx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkSQV0sZOwylR/N28yhox7+ydmiMNAxRbU5lo5XQsXFDrbmt047wgbP1om5ycJIgykuMab5jlcO850oVXCZdFOIA2bKyj6NSEuzr/HX8ktCWvG9u/E6s4FlRdD/Qxjo6RGOLPIqrhp0OWlX/SUmeI2trEAt8tuz1nSknkp10rp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3W+K8Pp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3W+K8Pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DFE1F00893;
	Wed,  3 Jun 2026 01:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450140;
	bh=VsZXkkEMNm2wxRoC0j0UqMhrJaPjz3OizoEiAzsqfAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k3W+K8PptrRpq4igUo7e9pFq2sHzeb/c6rD7oXmah4b493KdKA/D3xail5LMd/HBH
	 GQl19tMrX05LVMxAQ8w6pOXEohViDJSi7qPs7i1ytycDuDnyvEU2oHzrEXRgpUqt9/
	 8efpV08/7LIoTu1IFTnrV4sgXpDIkkpwoes9+iLY6lyDeehhMyHURq9I+X19nHQWvp
	 lfe9MZJC+gSFxlE9QjtI8qyF7mRdBnvOO2Mri1JCh/oSEsOjXSYv7u014MLUUj0xuv
	 wEuc8UU9OzR8nHKWqNP9W7IdnkqlzE1e6xFssEC+k7NpzuYpZDoaHD2CmQL2reSII+
	 oB0L6Hb8IEblg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	jakub@cloudflare.com,
	maxime.chevallier@bootlin.com,
	nb@tipi-net.de,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	jv@jvosburgh.net,
	michael.chan@broadcom.com,
	jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	idosch@nvidia.com,
	razor@blackwall.org,
	hare@suse.de,
	jhasan@marvell.com,
	danieller@nvidia.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 10/11] scsi: fcoe: don't recurse on the netdev's ops lock
Date: Tue,  2 Jun 2026 18:28:39 -0700
Message-ID: <20260603012840.2254293-11-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603012840.2254293-1-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fcoe_link_speed_update() calls __ethtool_get_link_ksettings() on the
lport's netdev, which will soon take the dev's ops lock. Some notifier
callers already arrive with this lock held. Switch to
netif_get_link_ksettings() and adjust the explicit call sites to take
the netdev lock explicitly.

Within fcoe_device_notification() try to only query the link speed
from notifiers which announce link state change (UP / CHANGE),
DOWN / GOING_DOWN notifiers are slightly sketchy when it comes
to ops locking right now, and the code already special-cases
those by maintaining the local link_possible variable.

Also take the lock in bnx2fc_net_config(), even though I think
that bnx2fc call sites are largely irrelevant since it's not
an ops-locked driver.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c  | 3 +++
 drivers/scsi/fcoe/fcoe.c           | 6 ++++--
 drivers/scsi/fcoe/fcoe_transport.c | 4 +++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index 26e0ff380860..c95b084cad69 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -17,6 +17,7 @@
 #include "bnx2fc.h"
 
 #include <linux/ethtool.h>
+#include <net/netdev_lock.h>
 
 static struct list_head adapter_list;
 static struct list_head if_list;
@@ -815,7 +816,9 @@ static int bnx2fc_net_config(struct fc_lport *lport, struct net_device *netdev)
 	port->fcoe_pending_queue_active = 0;
 	timer_setup(&port->timer, fcoe_queue_timer, 0);
 
+	netdev_lock_ops(netdev);
 	fcoe_link_speed_update(lport);
+	netdev_unlock_ops(netdev);
 
 	if (!lport->vport) {
 		if (fcoe_get_wwn(netdev, &wwnn, NETDEV_FCOE_WWNN))
diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 534596c6d76c..438ac7c3a9e3 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -25,6 +25,7 @@
 #include <scsi/scsicam.h>
 #include <scsi/scsi_transport.h>
 #include <scsi/scsi_transport_fc.h>
+#include <net/netdev_lock.h>
 #include <net/rtnetlink.h>
 
 #include <scsi/fc/fc_encaps.h>
@@ -737,7 +738,9 @@ static int fcoe_netdev_config(struct fc_lport *lport, struct net_device *netdev)
 	port->fcoe_pending_queue_active = 0;
 	timer_setup(&port->timer, fcoe_queue_timer, 0);
 
+	netdev_lock_ops(netdev);
 	fcoe_link_speed_update(lport);
+	netdev_unlock_ops(netdev);
 
 	if (!lport->vport) {
 		if (fcoe_get_wwn(netdev, &wwnn, NETDEV_FCOE_WWNN))
@@ -1841,6 +1844,7 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 		break;
 	case NETDEV_UP:
 	case NETDEV_CHANGE:
+		fcoe_link_speed_update(lport);
 		break;
 	case NETDEV_CHANGEMTU:
 		if (netdev->fcoe_mtu)
@@ -1871,8 +1875,6 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 				"from netdev netlink\n", event);
 	}
 
-	fcoe_link_speed_update(lport);
-
 	cdev = fcoe_ctlr_to_ctlr_dev(ctlr);
 
 	if (link_possible && !fcoe_link_ok(lport)) {
diff --git a/drivers/scsi/fcoe/fcoe_transport.c b/drivers/scsi/fcoe/fcoe_transport.c
index 88d85fc9a52a..2bbb9a38e61d 100644
--- a/drivers/scsi/fcoe/fcoe_transport.c
+++ b/drivers/scsi/fcoe/fcoe_transport.c
@@ -111,6 +111,8 @@ static inline u32 eth2fc_speed(u32 eth_port_speed)
  * fcoe_link_speed_update() - Update the supported and actual link speeds
  * @lport: The local port to update speeds for
  *
+ * Caller must hold the netdev's ops lock.
+ *
  * Returns: 0 if the ethtool query was successful
  *          -1 if the ethtool query failed
  */
@@ -119,7 +121,7 @@ int fcoe_link_speed_update(struct fc_lport *lport)
 	struct net_device *netdev = fcoe_get_netdev(lport);
 	struct ethtool_link_ksettings ecmd;
 
-	if (!__ethtool_get_link_ksettings(netdev, &ecmd)) {
+	if (!netif_get_link_ksettings(netdev, &ecmd)) {
 		lport->link_supported_speeds &= ~(FC_PORTSPEED_1GBIT  |
 		                                  FC_PORTSPEED_10GBIT |
 		                                  FC_PORTSPEED_20GBIT |
-- 
2.54.0

