Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B094BCAB2;
	Wed, 17 Jun 2026 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714979; cv=pass; b=Rk/45RqOqAknWATAu50Ax+5oCNGPxDpK4nL1p9yI0XT82Qhpj1k0utCvzzJvDj/OrEU0B7UywkXVzl+SzQA4zuSetIDi43MxHi0MMP5iKp8mtobyYNjWQ7DVRxjUjLLPs2A3sdXi82bduWkI2paqyTKTQuUbt0lT47izQ0TgEsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714979; c=relaxed/simple;
	bh=3OooTjGvHAgUqoPXJKC54feW9kUvT6QF0t3yuHq17IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7vfcWKBzK4qTKFRBtZsXEyp+K0UfeyscDS6+QKiH2TldCDNIG2EKOcDdTuoFu2dOOU0GPpvItlTMUm3AI9NTVTHJ2cyIcfz1LywBrDy0YZNFsTG3HrjdonYXtthB9pWafF/vUeUaxY3wMmemJ5tmuDXqVPVC55gv3FFrAbkN7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Gr3eJh4L; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Gr3eJh4L"
ARC-Seal: i=1; a=rsa-sha256; t=1781714953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cX79YDWN7ITYRyqTPKEP3tp4BYRnlif1o9/UuEV2zdHOrZ7iAwIN5OHhwxNkMVWYL7uI9Ls0duEh2jbHg/9Pekv9ZYPtlps+y8wjjf5BUmhNz/d5xzu0HXxwWCr/pwXC5UUhGx68TVrB8qwcuyi8/0WCAK+hnYSTuIzjR+znlpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zsumvDUH6kJRxb9+a0rdMaHG2cBXc9VLurrnZsbYFfg=; 
	b=OwhawjuAuPS5lD8QL9htOXvWOxwHlBw6xyf2EeQHOdpbdFXfrBJNSyYEepKJruVh6ssEPWIRT6dfyTj6hXQA60T91zONlb53fm0VFkIiBgabZqRbvK8QXWXjN+ji87MOuCAsSexZC2uTzcSaxlUFoX2vCDqyWmBz553qEWgRNNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714953;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zsumvDUH6kJRxb9+a0rdMaHG2cBXc9VLurrnZsbYFfg=;
	b=Gr3eJh4LRVyl+BxUP2JYSlGvKyFFCs4VqFZPE5uQBt5gL8xA4TgTMbrwlE+D7cX/
	sz50/TpQH4/GQd2Nk9Hy7MVB10/ic4K6PP/OPVCyM2rNhZYE9WzCQj29rz3q3R1SOZ9
	/NBY6WvR7CpHug9K/7uZT2M3RjMv8Bm5aBepyms0qadACdpeeQRv4tS2syX2S/2jS3N
	NQPldij5Gum0vwrDE8kPjoBKr927LDCoQGkCPjq5R86QvMVb136z/2p1F7147j+Ioyr
	2lvgmROKFOoIvKWeuffQF5xEeUVinW/jyNYLEnV6/wGi/kLXJaM0GmwpCQ61nKzF8T1
	EHliT9jtSg==
Received: by mx.zohomail.com with SMTPS id 1781714951074630.2937626780465;
	Wed, 17 Jun 2026 09:49:11 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:47:56 +0800
Subject: [PATCH RFC v2 2/9] leds: cros_ec: Implement offloaded() callback
 for trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-2-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2..f48e3cf6ccf6 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -86,12 +86,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.offloaded = cros_ec_led_trigger_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,

-- 
2.53.0

