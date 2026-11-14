Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679064;
	b=NOul+PZZN3No5AZQdAUJZms2Kv8ophCv4eYoQNjYnS5chJaE42oyIELJgDVIKXkeWigE
	 gQpsUrc1XuARdJcIf6w7eSJ7jPup9TBeBhIeSSLWmb+oi7VS7TW59BBvWuv69WwtOcDPM
	 GuNdkSXPtmMcQ7nMjlGia4Bc4dD+HdgftEDzo/Dh/VSQaKTX9lczaQYh7jH8dGVD0/JRa
	 CzefosFGzDhBuwrr6xyO+fUqKP2LIsFgQKqA3B4ghIsqs/3BaDJnwJUM/+GReBMYpgJCY
	 q3C9otGBUgRYoqHC5O5iV6eEhpM9UsWaOLRXemJ6ZpsBuTKBpbwpcde/86IZpudD3mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
	b=1M/GjjPflRgyaWtTtOUdp4qdguITER/8E1hNaPeBktErwjHtEQsqzbyOIzOamRRNL0SJ
	 2npyFrKXeU28gvWb68yGKmuTKOaXXT86RwP68eIbAqQk6TZqmYVe9WZkPgrEzJJM+wCDA
	 GQ5BJ7+b6ANWHZIt+kn/fB4tleXwBs7TuVjS850ouPifzXfDGX8nopYneTBD2/OJCMxlX
	 zJp3oBX1c4URjmuEloOrr/+Gn6N72rlqq5EvtO6RXlzMxNxRDhsm9TtObW7psOHSxFcSt
	 wdUKxNWRJxo1b8kJOXmrh2vV7Kn/xhjL1tpzIZjqz4gLsq4fMk2zI09MDZs2HmCmhXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE5606A330
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BE5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1309930a91.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679062; x=1795283862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=uVY0MyVuZmhOAAyRx9i6zCyN6goxVQeRCc9doxD5EIBEIl0RlS7avzF6/amyzR1sOR
         0k09UfZHtYRq//Ob8WDfQVipRBc36fUU/+KpAFrin/WmvQVOqVOa2KQZeKXVD65Nec0M
         czKKAj7PNb+6nkUBh6IIQIqp2RDw87Gv75E8zGIceoOe2KhcGcM+y/rfakUgbCq6Kd3e
         VwzY5msviQm1yWZS6Uf1wpJb/EksOrCft1HrMr48QhaWR4FqKyx/nqao+rig8Fy2adZT
         ApwOovPWpfc73F5yUGDsS6Ip950ezI9b4lCf0kX4bVeYYXbThhQcaNoch7WGKH2zUTwc
         wv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679062; x=1795283862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=WjIFffOEQj0kuqJ7hwMq8PieQv6dw4mjyX8xIvt38QcxMYPJHl5PUbfxEDoIi0m7BH
         Xeg09bCS84buxDMBEd7y1BZKgCt/ml/Q0uWkZ7urE6MCk85xq8S9kvQ1raKbsa5VKViH
         SMb6RzlENbQ9phQh/nOzdopPczdvydkxHjWy/30hop1OWL1643ZKNSN4bpVhJvGquGph
         E9bNY2HdVJH5ackuob36mUkk3CrCqrA1OR8GvkGMvtWXJebwWKKLRFzfC+Cg08hsRO5K
         1k/u5+JtUrXLHJwWKgh7yqXSXQOn4HMREQ0jkxRPhjRQFJUKGxLtyFzknYer4cfZAWQu
         lhlQ==
X-Forwarded-Encrypted: i=1; AL+hErEN1H00NInUz7gdfj4EKgrWfOy4rY8dPW2jeWbS93Dy0TUrKZT4hZ2JrdRUM0jZDtBfteG2jX63N4dC@vger.kernel.org
X-Gm-Message-State: APuU4Z8HnV+WoHC1vA7ga6aieZbBONOFRaB+Yk50gHS9PDs1v+7Mt/Cd
	hHQAN0558Wjf3XuaHSZhqxxQg95Qntg9JbOR6zh7svRdkkJMgHpD4VKZ
X-Gm-Gg: AYBFou3O1vpvug1YbcBmZzRl08tXhOPb1MJznJWmNijhEqoIgjzQ0ux1U0HMqhTqWXu
	DVzT7mOkhv8MAU8bytT2gLCX5U7rPW5SYaw72jjs+w9/0sDUEmwpZldoRhX9imLDcHTXJrdoTNi
	LYtDeH7tFYF+MOM3Zue0Q05V0YWzVoqZVMFGDF+fGKprr+YC+AOF8aKOXCAg8gZxFwwBLJ8x6xb
	7T09Qzj3/WDqgZ43s9wkENdWfIZwuOpRhudIDFLIhFI+Nfdfbd+9IeoTZj0P/yVIMqvNAPAvSFn
	zdqWYSAoyPEafcgXickG0ZzHnElA6f2iWxnmm4+1vAk2CiY2G7iyaWhqaOA8ekIhh8o7fEQ1BFI
	CYXzPgsdxSJ42kq63z30K7V4GDh/qY08PvglBeuhjIJpBa7FWCs4b+I1Sf4uCXjm9Xygj1+mRAj
	I58HbHkwMN+RqOw4T0MDqYdaXMiM6cd3j7e0bl5hg+UOae7SVNDS8V0rHm8bDEZQIFQcfKVjrWH
	Hpms2WjzyuAoTY1nvRTTf5ZEw2oYAA1bXi2PYq2/Vngl+JQkv5bzIoOauN7iAmpk9Pcm03Ur1EO
	nW+9l++Ag71N/WSC+xcwyS19PmUz
X-Received: by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr5861211a91.0.1794679062608;
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level on resume
Date: Sun, 15 Nov 2026 01:48:14 +0800
Message-ID: <20261114174814.62153-8-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware does not always restore the keyboard backlight level across
sleep: after hibernation from auto mode the EC comes back with the
backlight off, without emitting a notification.  The cached level and a
possibly still-active auto trigger then desynchronize from the hardware
until the next user action.

Check the EC level on resume on auto-mode machines and route it through
the regular notification path, which also deactivates the auto trigger
if the firmware left auto mode.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index f11e61417..802e0d53b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
 	led_classdev_suspend(led_cdev);
 }
 
+static void kbdlight_notify_change(void);
+
 static void kbdlight_resume(void)
 {
 	if (!tp_features.kbdlight)
 		return;
 
-	if (tp_features.kbdlight_auto)
+	if (tp_features.kbdlight_auto) {
+		/*
+		 * The firmware may not restore auto mode: after hibernation
+		 * from level 3 it comes back with the backlight off.  Check
+		 * the EC level and reconcile.
+		 */
+		kbdlight_notify_change();
 		return;
+	}
 
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
-- 
2.56.1

