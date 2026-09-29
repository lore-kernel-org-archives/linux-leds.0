Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6531D4E50CD
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674196; cv=none; b=aqp7CSN2X7ywCdE7t1YoIPy457iePLOvoww8JzOS7fZ+HloLUK0nw2WM8oxIy7zXmP8hR/f6x9QQ80W9aS82zty8aUnGCIqlrv8n1J6/O6HzpjP3KgROdsK12NTbMkfBDfWzUeLivc/OGjnBdTe4JuENn8bc9zcliy4dZBWpbug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674196; c=relaxed/simple;
	bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC9fFASJPrXmKOPqLigBPcSTpwm6NPTrKTJIp8f5142BvFImXp4pRcOM17vOGiLYMLgdHGQn8a4FtD2St8+fosKWNJSoEJMyKnOrWUWShU3tvaJ3vqC+QZmPOJYDUwZjDRivX6lO/6DWfAw3eD7Rb31g9L0Ht5Xkg6opxPAJQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp9x3kaG; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp9x3kaG"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba31af701aso329424e87.2
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674192; x=1791278992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=Rp9x3kaGFPezog0Un7i8g0r2EtmziA+deW1YfGgSzPI9wzs8kNyF/PHzAnE3AuV9kp
         /ZXl8MQvKZxSy+3BO4cG8o361j2islCRP+ljmHnBt0qaWVLHfe62hHdmnSSs5bIncxo4
         R7jOBKQ18fgNu4+M+UnyBCPkuo8diEMsp2IgVoWldwtt5QsOesSE+D68aJSz2kPaiS1Y
         aOseOpBUNqmVohomL9ILgAk4CqcoYw76HO2eL3jiQ0IruWZOa6LX6p2PyI4STZyKtsQY
         StuJZ/eKUK5EC3jKRfqLQEZA07XcP41rwg7BtjV7SGiEyO23nKnkH9634E7jAZP5Wfva
         bP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674192; x=1791278992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=BUuk5U4g9o+2IlTuA2XFNsFyDSD37UjIlfzw63rteOi5iTBN/YaCA5oISkSINDe6jo
         /OGqxuJm+XHEZ1GSLg879BYnnHMpTmqhc4ck5Iyd2Kbh2XoTB7O8FglJhOOOgYcRz7sJ
         KKCuA7ZCuhwekRQKHbmK44Tl/Ppe1FJ3OnOS9jGFIGuB69LBuOuNxNpxACrREXEhfzgw
         4Hy2qEqcGIWLVxXVnn+RYxm+LF179nzb0SX6J7s1SZGH0lwQ+S7IDm2M0eDfZoCb5PUP
         QwAqoJYkzlLs+NRp36ugyLq6fKMaM0nsJ6CEKCUIF1Tbw2fXBuUTMbq3ZdwUJpYz3YQN
         13jg==
X-Forwarded-Encrypted: i=1; AKwUvByk9BA+ecVTl6i8iXZf3w3AsawtKtBxQeR6GQScbgB4SHva7tgi2oAnAetaWfgaKEBVkC6ZrrkhUis+@vger.kernel.org
X-Gm-Message-State: AFq9FYKsW5DixoT9PZ2AuQFb4HLu00D70315WkIpH5VJNRsg2zGWE4BN
	4rxX3zmSW/+gQklmtELQbkIFssGyZ/a5JdmFlfss8cq1I/kF1heb5gd4
X-Gm-Gg: AYBFou2uMSgfJ2aaJLoJ3GYj25Gg0mBQIB0q7QrpkBMmkx9mFglPz4RvmxqWYhzbrmh
	09PaXDDM7sJieXjNmClnuuhj4i2U5qpmWJAg2paio/+Dv3jymylesuYZskV73B8i/OjVt+AgUKT
	qKazGDzWEqHmG+6krfgeIuz8uQWWfD32i2H1VUpV5Lw8KRAIhsiJwQkQec99Rk9BUXdGIU64mz9
	xDYT/P6rSUwePA05Ch8fq9TJxVOURSOZh3SyeiC8gHNFxnEoSMgxB4lrm4bmKwDFRVJBiVJiyW4
	E0ITmNEFfqw75sZfi3rA9GpUVOkMKA2dp0l1j9+AsKCUif/GvENZHylh8YiswwtDjEgcK9oU5v0
	c5viLwQTh095LOEePhLPmj/oHJBVFWrL/lkIcGObJ8CO9H/3EJZQGoZWx6C2xtevTep/7Tr2sbs
	T/FewRbblxc1HSaibAWWNs7iPx8nnLDmXNmqVXXAw1/Wg93KlzPYkouaohogD6S023iqfDQsjBs
	34lEdaBWHQ=
X-Received: by 2002:a05:6512:686:b0:5b6:1a7c:59cf with SMTP id 2adb3069b0e04-5b8df0c6fb4mr5787163e87.41.1790674192165;
        Tue, 29 Sep 2026 02:29:52 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb906esm1219348e87.51.2026.09.29.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:29:51 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: rillian.grant@gmail.com
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH v2 0/4] leds: flash: LM3643 dual LED flash driver
Date: Tue, 29 Sep 2026 12:29:18 +0300
Message-ID: <20260929092917.1782754-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rillian,

On Mon, Sep 28, 2026 at 10:42:33AM +0100, Rillian Grant wrote:
> This series adds a flash LED driver for the Texas Instruments
> LM3643. I wrote it to support the Windows Hello NIR illuminator on my
> ThinkPad X9-15 Gen 1, which has a single LED connected to both current
> sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
> X1 Carbon Gen 14.

Thanks for folding my patches in. I retested v2 on the X1 Carbon Gen 14
(7.2.5): the DMI description is picked up, max_brightness is 71 and
writes above it are clamped, max_flash_brightness is 600000, torch off
puts the chip back in standby (ENABLE reads 0x00), and a flash strobe
times out and reports flash-timeout-exceeded as expected.

About the Sashiko comment on 2/4: led_classdev_register_ext() reads
max-brightness from the fwnode before it creates the class device, so
the window only exists when the firmware node has a max-brightness
larger than what led-max-microamp allows. The DMI nodes don't set it.
If you want to close it anyway, clamping the code in
lm3643_torch_set_brightness() against the limit derived from
led-max-microamp would make it independent of max_brightness.

For 3/4, dev_dbg() is fine with me.

Ruslan
