Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FB472F76;
	Sun, 20 Sep 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933409; cv=pass; b=d0fypGqdWtroPVF/Tj55FA9EdD5Vs6dIGCt/Er2KA5THU3DG9Xx69AuXId1uKFmLYKjhX+703/ZMNkJt8745ru4zpeaQ8ncFt04Sb03/b4iLEd5Ba2IQH8mrciWNlcxdDY4JzTPr6hbSs3HAWrKee1lc1eYlXEYNcAA2P0/hqAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933409; c=relaxed/simple;
	bh=+MnPZ6eTfH7cB4uYmJZeytj4RVmJh07mpPdY3pCeH9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+9hUXX875viOUixSv4ZdEwkCANX2ZraA0GYn+kXCUuDkrtUMGCsPpr7Dgh/zsyG9zSdZf3Yr43BdKw+fyLHy8dBkWb+G1SCA2A2h31lMsEVkV+0hDhJTuJ6bBIqUK9yfTR1ehKVN3pYFZBJGA+XdwN3hn3SgEOFA7e1iRPZPtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GtCGa5oJ; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GtCGa5oJ"
ARC-Seal: i=1; a=rsa-sha256; t=1789933254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gyqy9eiW+fEZA0CzF1GdQbSXXHlmhRSrPx6RdBI38ypkSju7yDiWnOBpzc2WYhPNEz18+hRVNRCcguDOTYDME3vSNJxNzCZ9Ox75GSI2tMbWO5ZKKYGC8OfJfrNfx2nE4BkNfwNbTuLsTzsqCtvX/+k97f1pQ4/oLUWbAxvd54k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0qZIsMmvYd8h/PC17ld1PmriS5Rph3OJl9Ig1y/Rtv8=; 
	b=m4efM7RD61fNHVP4blM6cxWJKcQXAm6Gxwrx99Obl4lSWUrWvPJdKhmCfQt9uDhXGslqLAPyhxsrHmRh0MSwyeLfM5Hw36im9nviXArkIsYcrvRs6IrqRs6yERnZD4KDkWudyA8Mmsula09Z5p/KdZjP/h+p3zvkNQgeY/QIIfg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933254;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0qZIsMmvYd8h/PC17ld1PmriS5Rph3OJl9Ig1y/Rtv8=;
	b=GtCGa5oJS+CN+Njt9crtEG4fQGVsa/eZCPw6z+CiT6bkipxPihI5QFPoREP9gpBq
	uZWYuBe5CRV1g/mKYx0LZTbsSekNw3xjrT3jGki9thjy16ga1viDJuwHjeAlFvcl/AM
	y3gqhFuor8DbI2f8+v/WFMKgoWcai/gGIy5+fStPtv/jw8aDkaCcjRqBjQi8A2EYKfE
	+57XeAnflOMG8PFKdOWeYj902hCDJT20SiGZDuo/96n3OBgoFyvZ3d7qVxbm/y6CQRx
	kYn6fVLtcAYELJyiQdmPDpKrYd5sMjwZVOIKiPi5engrM8j3qD063FmaVwWqyLemSQX
	mjHEmHFTwA==
Received: by smtp.zohomail.com with SMTPS id 1789933253374126.41935058215722;
	Sun, 20 Sep 2026 12:40:53 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:20 +0800
Subject: [PATCH v7 06/13] leds: cros_ec: Implement hw_offloaded() trigger
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-6-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
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
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement hw_offloaded() callback with its return
value to be always true to reflect this.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 1844d0cd5f52..0e93aa28a8b1 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -85,12 +85,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.hw_offloaded = cros_ec_led_trigger_hw_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,

-- 
2.55.0

