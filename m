Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596551;
	b=mOJc9DZKllwcaZU07zTM51t6WC7kTH41hu1b3NJuX/siUQme7XNPuBcQ2so3sONFkh2m
	 +8jlr72YSoQUAetfYL6ol17BIwqCeRhNsGtjpx42shcMaNB7NzRuQ6gWHtyf64CHAc9KJ
	 KA3hD/S0fYV7w1OfTrO/o3ojT/oZ+7gzsI78z7KMtxiPOhApmLvrWR0wn2unLDdC3rK2Q
	 5SipZjUHcd6JHmSFpd4k7U3iR7Gzs7VwVYf1Gwbl4xC+li/rilohSkeCb3nZ7wM9nB8O/
	 u6k0rKiTE3Z/2MZ1UkLak5/4V61/Pw3nQL8cK0p0HnADey0efvNd0QqPyE62jkq6WEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
	b=jrR6VBr+b4v3cCCW3tZG2OGYBe8eDf4Pj/r9uXQn+IlOX9BRwpOrLfJCobhEWa/m/7ax
	 BMVvaevOJVzt612rOCS9Wd/1Ss8LmosHXp++lp8u4dYQNvJC6C5L3Q5fSfq7Ga8JmgkKH
	 GvgFSia08SXr7gHxXWaEs/X2v7bygfdvVUcVk+C2oB5LVzN34kR+TTxXIsfqEK8Dy3dmY
	 klSLRcUucCv/aMtbiDfQHv29HVOEGAEWP4odUlCy4ZvRu4shhRXWiE/d8ogyXIE5tk3na
	 Hea/Rgq95Mscftgy26BPIU9shaFljIWeJ0v6gzJqTEUguJ7owrV3GPzV9B1LSUyWETQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5343D606A327
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5343D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097771eec.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596550; x=1796201350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=YVdS6NKsEgxgMl+WH2rlG2/mN2PT8hYdnHaeuOhQRZG7EfYaK1zmZXJyce0jl2qt2i
         aJiwmc9VH+KmokhJ9ZT+iLHqjlXU8UiUHvyoNMddEPFOlyNpqrp49y6xk3D+JHXSFaTU
         E/9ZUZLsJgMrty4m/xsxSZ07xNRJdc8FRWbVw0WhTYg7ONQG4vzHR8z7p7S+IOzKNJFu
         lN5LTmJE5tK0OFvdscRgKC0Bir+Wh3/mkVmi2g/0QNfdfoCCbYQVjtWjnP8j8qB3t8Lj
         vL77HHSgpry6pIZPKbEzockltK3nluzGXsFBqiXYvdWwDQw7LTJ+N2kMj+pbTJ9lOtt8
         CTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596550; x=1796201350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=k5/hQnOhcTIdC6a5XQKffke1pvvZEaj/0dslTwyu7jq/k3678m7DssmsNo2GASz1O7
         V+Rau+SNqLGzWp30qOI8f/ZTg8SBDMYmRnx38yZZ6ASaORvb5bbJh7onsy57+YpWMTnf
         lVRVPm2a35qvuHi0RQJEL0YJ0CAkoZv1XZopzGnMaEBc0MAB8XsMIW2i5ozW+OWxtMC/
         6ds6/lbQ5+z5620E0Wry9L9ifmekYW2z0rU164AWoAvUEKNB8ET6v7SIr628pIT9c/P4
         AlqFwBxhenZAaqAQN5u3Ncx1lvowG7RTGB8hNOEyd4DZKaB1/UAdCVAIVChFM7xDZNXl
         09Rw==
X-Forwarded-Encrypted: i=1; AL+hErE30cgwaM+TJKEO1ibbCAJ+FhYuikKo0yu2301nMVoXRrkk2oHH4OHTRye73cGiZpsUGZqTTjXitJjl@vger.kernel.org
X-Gm-Message-State: APuU4Z9sI372WhRgC29Jurs+2av8CaoCr1q0yKi3id4pehwVlhYuZW13
	LM0En2HwmfykpAFJqA+6dCMSoSXulUkVgiDZ4Nd3LS542+wPPlkkT87z
X-Gm-Gg: AZFdTZduxpzemHTW5HCK5SxVZcQ27zYfe2eQCzO2VW4laX5hEDRJZULHOeoVRE2jn1X
	SmYcBBbtjFBDks3R7SkezHpzKRj+ItBmcBOGM2Tq5qOg3I2KXNA6GP2/6eF7N34mBNw18g3GAoL
	R8nH0qrelhsvkz67NmBLTMdSZN8hHPpp72d46UsGcgfoE5f1xCmguShokju84IdVonBByiZIeXg
	nR3PNd7dzYSJv6xXzpsfrGX+AtTMSY3nwT55h3IPcNUL/JLKLEH8qnssUrAEzvuuyp8ropsKIyO
	brJUZE1stL0v4GpBcFyi8wk+oD6UGQ/C4/CIR2+g9/e6XvqW9G5P/xMCi6bgaoYOi94vAs5ZI6n
	DYYuZITycu1wfa1iEtRIKp9t7IxV9wn67VMtnZwSluuxJb1AqI3m4pxHk5mkyNrQ3+IbtWpQNeK
	aSHEhHrRfPuEhGubOq/Dw9yjXcob7ZdHWgY4296y/JVZ7Iuejsc/1EuDpsQvdWfckQlTBCM2vl8
	+aSgJ1PpexA++ex1+V0ZmKAR7mS9aHDDpiYPZ6VpMJPtJjtHeg6Am8Pcojdj/3RyW2t1U1E9mvS
	16dbiEzQ+Ua2ry6BC8CvHWLoZfYV
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr11929126eec.36.1795596550406;
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 5/6] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Wed, 25 Nov 2026 16:46:42 +0800
Message-ID: <20261125084644.137506-6-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

MLCG bit 20 indicates whether the EC supports the auto mode of the
keyboard backlight (0 = manual levels only, 1 = auto mode available), as
defined by the firmware.

Record it in tp_features.kbdlight_auto, for use when registering the
auto-mode trigger in a subsequent change.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which tested BIT(20) directly.  The symbolic name was added at Rong's
request, so the tag is not carried over.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 764b1efa6..ee8f7429d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -363,6 +363,7 @@ static struct {
 		TP_HOTKEY_TABLET_USES_GMMS,
 	} hotkey_tablet;
 	u32 kbdlight:1;
+	u32 kbdlight_auto:1;
 	u32 light:1;
 	u32 light_status:1;
 	u32 bright_acpimode:1;
@@ -5105,6 +5106,9 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
+/* MLCG bit that indicates whether the EC supports the auto mode */
+#define TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT 20
+
 /*
  * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
  * tracking compares EC levels; the auto mode is translated to a
@@ -5189,6 +5193,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

