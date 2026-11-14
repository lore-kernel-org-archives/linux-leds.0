Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679042;
	b=vk8jyhsRtP0Lb1Qnw9OjX0P6P1Y00sqBKKrQTGwCRxILtxPWn3kd8MP2pcamYpGfT9JG
	 tN11I3N1t6BMNZkcxqftzEDelnsOMuB8OlSWti7qmfhCkkHqIavkX3zYVuyE3wrGms7qN
	 QuH1vUYC3pVWJ6BJlrPeHiNlx9spU20BlUadEXPC5rqboydK5rRQr71sLwggsgsVKec8I
	 PLvGVub5CM4TQX3mh6gjz0ay9hfeinMMryT47Dr6QIGjyso4qc61FDjKaks+d9JNg2N8b
	 PKQdBbF94dlEHijjhwVs6sN9mUAIC6OWgMub0MoQbpvNsAYNoOPPxK8EdBzYok6AeVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
	b=c4V5UHsUy75ua2OJI8jsuKeP4+slHIpV/lMmXFZlrRwQCTFkGrYYZUWDmgB//KgWSFTZ
	 ljh0nY8Lj31J2d/laQZ0044mjksoQnXAGgAipYmA35m85wq92ZhHwJkSHDJ4/1kLuk6IN
	 lKrg0Nq/aiKq4/vWuMyDFFOjMammZLIS8BgSN6nBzRd6lVh71Bv71fwhCj/SGFm8dSqq3
	 7xa7aakjorcAzvp0WwclRMEl5iVnoj7wL0PvX/PKNePdh6yOfNsSNh2kBFYlgg2lwo3oo
	 noUdtWS4NWW5ce2QjoC91AE5wgQWXamyA7UDEElX+/bw9xK9clXG6ZkuH3PZGCSsfHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF823606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF823606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso541736a91.1
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679041; x=1795283841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=iCB+37cY8eKgy+4WFCdkIv/dFsfVU2ctUo17GkuxpB6SE/rjfoyLA7L0eQYOi/lhwL
         Z4Kq8VrPDZoYfRBySAO1ABGHPuak8VEJTLXKkeU51h/VcfDh7RdTVaXMCl5hFXtyHGOp
         hS+2dNuL4WamTDmBaeYNz2ygW7hugmfTW92ob4PenTEC7Mxgwr1EWVF9XhC/rh8kpBNv
         CU5e6krvjFBiPQ+HoB+i0MeNvI43DA+UxzjOTH6gU5nsYpwTDjg8dGzgc0+CCG1hTEKa
         8WzEraYLXqoLtoDFxy7ekEArepYOA5MZfpYSQZwWEri7WZ5XaNnrmKrN9BAvAiY3QU40
         f3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679041; x=1795283841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=E4deTBZHMGWGWTy/ApuZ1cWv2J6TJaZrTnv0c42UZJWhZ6VaiHj9SvvYaJMrbMrU4J
         gABJzYfBYjpOr4FshP5RSTzkJI9TElcnjaXwjdWzqx4o+1Ar4pBzGI487LQxBFyn+sZV
         Jf44GeqK6R9IBgENr+FHZJANwY9ASa+FMA6sffLeTjeoM2NH8Aiq8G+d8u3JrOhtEPlq
         WLTyT8URSoK9puntrMLRANn5LRP0WifQpIpq6sfC9xBF0IQ6NpR9OmU3LiREnf8falEB
         dbU3596m6WrLNh6wgnAUk+YPaSKrls7jE6U1oityW6XPgGrhqGg1bKtwski1g0OxkN9V
         W6XA==
X-Forwarded-Encrypted: i=1; AL+hErFCa5pQgS9yu0DK3w1xovZe6vbp4x5oIpN6Y7TeWn+xUFMNCfHFoJwovNUyDoM18i5V2zaCJ2C8fSY5@vger.kernel.org
X-Gm-Message-State: APuU4Z+T2yO+l2COGsVLo27OvV4LQRAyS9kg7eMDZaQHoKA4LnXPjdms
	2Kv2XFoObivJHtopAFACYGX9ESOQHHGZZikhYiRJYah1IbJqLVcQUGBo
X-Gm-Gg: AYBFou0+WwLr+WBKs6JjyregjqtsQ97uuYmaDssV5+MgIM+vaVBEHg8WamXZVWV4laC
	FCSxcMdkuECHEfjrkvdhKPv4mwUwtFTWO+tEX7WhX0zFCtsmHhWv87UtGUkTF+DQGBm4oaugsgf
	LfbN0MVNhiGeK1r6y/Md44lVwygTcR0302QgbsO46gHoNIr7Vq5EYl7zdbuFJ5okoU4PIJ6w6H8
	B6astA+Ews+SrywnSAL1j5UWmI4KDMbjPsakA0znWAHgHUS51W+zCRwpexWZMMjwe3kNpFgN2Ew
	qaY1KfTZ3sm7yw0/Wa7K3D1WA+ZHY6Z9QZpWc9/AX+I25oW4AW0twm+JGEZ2CLZQjvSzurAGoMe
	mPdET4LZkItnA/9kAyHMB2+tr1QOZrycMmvkKbwJDLEE3H3ty6VTNFfLy75PrK5fpGtkLsExxJI
	MA/nMo93Y/p7LuL3LbvwQQ47vebb3AjYF+aT+fFQubbAMBCx78mZGefBTTgDGgxirYWXT3dH/dK
	ejSBKh+zN+0HNQthlWnMWSwm4yNLZxxK4DYOl9SJ3vxzsOdpfIIuvsF3Cq0xLjjDCQyCK30FPrw
	p0GYU3PW2gOGB0gNm2ucf7E8SDn5
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr5481995a91.40.1794679041160;
        Sat, 14 Nov 2026 09:57:21 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:20 -0800 (PST)
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
Subject: [PATCH v3 5/7] platform/x86: thinkpad_acpi: Skip LED suspend/resume on auto-mode machines
Date: Sun, 15 Nov 2026 01:48:12 +0800
Message-ID: <20261114174814.62153-6-kmatzkaczor244@gmail.com>
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

On machines whose EC supports the auto mode (MLCG bit 20) the firmware
takes care of the keyboard backlight across suspend by itself: on a
ThinkPad X1 Carbon Gen 14 it turns the backlight off on suspend and
restores the previous level on resume for the manual levels, and keeps
auto mode across suspend; after hibernation from auto mode the
backlight comes back off.

Skip led_classdev_suspend() and led_classdev_resume() entirely on those
machines: the LED core no longer enters the suspended state, which also
removes the window in which userspace writes and pending
set_brightness work would race against a suspended LED.

Machines without auto-mode support keep the existing behavior.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 681b340a1..f9e2d324d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,14 @@ static void kbdlight_suspend(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	/*
+	 * On machines with auto-mode support the firmware takes care of
+	 * the keyboard backlight across suspend by itself; keep the LED
+	 * core out of it.
+	 */
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_cdev = &tpacpi_led_kbdlight.led_classdev;
 	led_update_brightness(led_cdev);
 	led_classdev_suspend(led_cdev);
@@ -5327,6 +5335,9 @@ static void kbdlight_resume(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
-- 
2.56.1

