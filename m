Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679016;
	b=1Z0D/3QOdbbfC+20+SlQeTdg54X2pVeVK1pr+Xx6nGHNoursOPDId1FmumB/2nPVOCAH
	 0ADW4qV2VKhJFjNCpIjrj6edeOVCUe+shqZ9PcXnbxNNBnH5xGFHJPQRrnLM7YA6eGPbP
	 GM9AHwkjMevgHhJiouh4pxK6lURfBHPB0Lr4cmPerm8LAOSpxXbNNvWx2JFiRgZJW+z7o
	 93Xk2Y2+4I+5chiZVH9WJb09kSaQ3WbqUQ5hif+zls1rlJg17H3jiyzJu4EpdKnWm9npu
	 f+48xeU2U69tfUZJz8EnO7RtrMsyNRoPnrKJPgHWHM2/QtU9ELIeb9a8DvoXTepn9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
	b=Lc0BGRuQi5KdMsW2Ij2gX5DCF/NXWmKkQVkhBXPpVZX7Y9jP7SzCcYga64217hX4F6K8
	 LrtDQWC6ld/QikxGBwvv7NqNoKB7HAka67yRicAzYY+zaUxrVs0qgA8f6zrX7I3bFGhdO
	 yTr61nid3pxR1FoEu+naMOixdiWBYz9KuCIX7QNbr4aBGNuJX0xLvLLL9Cn8JwgeYvN76
	 MV6tjmRr8hbAWDEbWII3BMOpavKz2Gf/EKXzP+cbxP/vOR49t8wLsCoOQlW6i8QNX1sqp
	 1oeaGWwEuuGL2MMJCSJDVxPInLIK/MAZXVsTKwGVfekNmqoULMZ3xGi4tAhK2VvvCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5185606A330
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5185606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b1a38a5088so617999a91.1
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679015; x=1795283815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=dGw4tmo9z+t76UAJs1CPliunMuLwtHk7Ox14ZM/dtk3Hx/Hd8X6ZX5FrT+EpM1JckQ
         IPwMVUb5ioQmiV0EGAleMkifei/jmqEWDUvtweUZWM47iaFQbCs6nAoB9/lA91K+P4Xx
         a5eicwntQdaAv7r9cqukiwM57kwo5Zx50GOu5JChOqA+U9P2CFbKgR0nNzFnw7usUtVH
         vxbgtMLNRihV0HLwJpIb/0r/Jlejh4IS3jcDheSiNvWGH87KWu9hyQ+1yiPL+cHfJgM8
         mDtgppq85xKtHCrjzO5cdqP51BbfJyv3MoD06Ss23/vhOUAF5GZyYdjDlqoCf4R9Z9fq
         BzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679015; x=1795283815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=AeaO1OWunas7EQMdX/Ucwv4wLkhECyrHh4gih8HARPaDEL/qR1i++uPhZqbmWNY/Dw
         7vQm5ehtbD1JjQG8drxgBWcKiWd5zstCmutMNYqG/ZWlr95zkVGCsxAaYRLUjiXe1Ohj
         yRvqFaWslFqFu0vuOWhsUIShlknRc1VeP7Gs1rr99YguTNH68z2EdArZx8ATNrvR8Q84
         vKzXwO/APARrZxaXPPPbibQxpRVVCZg6Ox+Rw7i/oBUfb89YVTE4KLJaMVu1clbLar7u
         i8tcHlCpLVzRpoRIhimBU204w0YoivIhp9TQlOLD7tw+PVkkO8XoABcQt3xu4YQjfKK0
         hlew==
X-Forwarded-Encrypted: i=1; AL+hErG8AaD7KuRYbKQ/QWa0BVg4PcDFybGESQ+LE1g79prAVY3OK8xjI5NZHns46MsQtOnCOrmWd3+VI+Uf@vger.kernel.org
X-Gm-Message-State: APuU4Z+58ipzB+fc8MobFo1D8MwxhX8D9gGOPRvYoAEN/g/YyaYoNSs0
	vfdBeyeb3SwiLmug+NniheC8Rp6ZQAHs82ijQarOj6TVinXAMcrZrslq
X-Gm-Gg: AYBFou09v6s1/fKFhWAfT+ZKKzDDznH1z6AA+PIOxe+IaFH/4snuj38PRKhH2kM+kFM
	ZonbvWIUNQeG/IaW33rAagf+U61/NKihlfiWdGpDnQdWIBL/pN1iUB+tXZPmjBZVSyAlJ94ffkR
	vUABfnnd2+zv6L6D8dkBaRcz1iKa7FFDP0ZgRTPu2lxsattuRoquPas0Vaaabgk9GzWfdfgDVhT
	FnyGNVHe8L0fP5Kj+dbjTrogTHuiZKQ3e6VnhuCavrkQqeVJ/ZIpNDuOWSZe3wP4ca+AApiVKvk
	ViINDjOfzs5/fp59UtJOBh4IyZtjO5JPkqQwcaOqYcvRSZBqPGvSH5Jsp16CtDZK1Fs4dwN6cay
	qkVE2vR8CWdjBb8oYu88DjWTa27bVcdFbBCzUZA9uWkySGMipKKLF2vaAgNGyXz2ZGHsUY5Hqku
	vP2hl2ncH1pfdlVYdBaVLyYzA7XwSZOA16DgAtwYiQFSFm8T3Tqy1CU9Bg0uyDiYG4SLkqJRl9q
	J+dJ7C7fbolbKS+3sHIYQc4TuU+YlhU6rQuGbjiC4JaURy2lL3BgkJu3Qs4Hw2YwN9wqLw6Kd94
	13w0tChyD7+esNeMY7kM7nAUW26fTR4USXo8ACeCbioBSYrIIw==
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b1b0a1f097mr6398191a91.12.1794679015270;
        Sat, 14 Nov 2026 09:56:55 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:54 -0800 (PST)
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
Subject: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Sun, 15 Nov 2026 01:48:11 +0800
Message-ID: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
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

The upper bits of the MLCG return value carry capability information.
Bit 20 indicates whether the EC supports the auto mode of the keyboard
backlight (0 = manual levels only, 1 = auto mode available), as defined
by the firmware.

Record it in tp_features.kbdlight_auto, in preparation for using it to
gate the auto-mode trigger registration and the LED suspend/resume
skipping in subsequent changes.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 657a19d11..681b340a1 100644
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
@@ -5161,6 +5162,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(20));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

