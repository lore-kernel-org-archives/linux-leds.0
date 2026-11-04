Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=ETUegsdiwA1UUs4zcsmvHJgTco6oz8CvAXOIJiztNPli7BSt2YCq2KRiqzjEW/ab0DWq
	 pUQ/BBQkzVsLPUL3FmgUPXTTrSHQl86Va2oRWaq7/s+g6vj1+FIXyCe1mYHdO7YpZU2+1
	 y6Sl1h67C54PxaXFDax3DGCxnDtU9riJlvbpCADmoGO9VJQY2kyrY0zd0AH7PEsY7/lye
	 QqVykmvmqjjs0S1nILRzLq6QL6yYmqCuaKzSEDYnk2jZCT/+i+8LffT1LPfrZYTM95x5h
	 paW5F36xvEmQVG589gCqMDtVbb8G0bKvV/1A7B5iVGdgGIOPgZ1wuBvwWjg5ZIqVcqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=QMNpxWuuSRWRuaiVs048/jktb5Fws5RVCkTaix67lSipbMazhqobdvJ5vCbB2YGS6LDL
	 JzrmIbB8kQ9poFlItKtGNCydWnsGvhESK9MJksr1fibLgRtvpjv84XkMVfZGet/T/bxZc
	 EEvU/sN2gAo4hk+BFbKPxt3mF2zRlQmxci0h/H3KNwOLc8W96msLxo/M+UCpNlEXfx6GK
	 qhJkKhEWKZry7R4fTF23okyD4pRDpAQBd0qOwnVJxHAzqc+xzUeeBcZcZ7Rw77rj25lDD
	 u52O/Rleh0N1DoaKsQvkFVnyZjcJ3/nCAZSa6fbSa7EPrAAyMjxHQQMOBdoGbCFgT4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20511608B1E0
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20511608B1E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1adbf62dd31so1554473c88.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=PhgChsRRxoaFlSlkRP6+eJT4KYEi14DqTMP0leDLu81FxLUk2LAC65QwDPBooqvAsn
         iH6XkP8S1MK/SwZxO3AJkItw8VOGPpqeDmiiYKv7myO0lnlZgnop7KC9K2NAgM6ukplu
         Gjsdpkx1k0Dhr49FqliSxtq+PV7zOW1rF8RqXf/q22186XabS9LOxL3XW958WfiYw+PV
         JBjD6srBvq+hK2XBFDtCmpOIf+gS9iJ5nhxA+IIgHZhp3x3Dcb+TLxzecX64kH4ggJZ8
         fI8gag+0WQBADwjfb6rFBnw2H4YR37v7+5aiBzykie/3yy5MmRaIYgT31jdFJ3lzFtA6
         N3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=ZWnXUvRtufov+peTym/40SOG1hv9nPmS08eeMT7xpPlj8g0S/RfX68pXgioXcTz99x
         5NhRT4izUHY1dBsK/N0c6JmT4dwku1yPYEW7IsERkNFdHOh3Sjv17EeK984JCxFoDsEM
         DKtoHKZR152A7GJ/2y1zFF2WXSLC55/Agc7mFIUM8pFxmbEYQ54MhOYGdXLb6Atp757K
         a5MxKH6+HbheXGXfVUmCnQd2eJsSs2itcftFQUE5/tXlKFiJnyDXTOjOg5sBuqM0Zr8L
         fQPnPrFp2lkVc+Y893XNs4A32wJ9icLVvO5orT7aJAlupGWfQ/Laiv65MTIqIBh39VZr
         ttqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5avSD5u8SO5eQ2CXAZbfa7Q1rv7+KCixokJjmjQFZ2SL/rFdD4W/+0TNhFRLW3+EhzABqOgpHT5MZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+YmjUFkJQDEj7ZpUZ9qZ0rUq3+aJx9PhmASSSr9K9+ShuqwqUu
	Zt+RWwdZDST2hxEGjNADOzx3stQtlEmRCpHWJZj8v1IlIJZ1uMQ+pAo=
X-Gm-Gg: AYBFou1e1w9b2WDRbeUJRmVUssurHdJxbqru2m7nhfvPyUXV/G6Tk50+vQvAsAwXCHY
	XUhAX59OFzvoDxZxgLOqd+akzhDRAhZxKvw+QjYxAeM/0Hnff8AzODCTEtPX8okvAhL7nh0aMWx
	GmW6Y2cINHuYnqxTGmVHuoeVJkwAI9xcGSfiu0XD0mAjT186VlQAXHjan15X5Tjt4N41vsaNLmP
	OW6Rj0+XtKENHx8u39j/17/wzfno7sX/GJN1TsA6f9FH3G4uNF8dcZHYkAXSlOHhVyZxnBakjav
	8jCb3LBewvUlfCM88UKPcmMLkn/yNBPdRspz+xM5JxuN2/SvurR9NkENOpQBK0LO56L8/7g3b+b
	XarS9EbQbQjX2inPmho9tlWV2hVIQoF/+pZUIIwwX3D0kndSpW003O/Re80QQck3Zw36RX2hLxe
	6KF1yIJ6/qO6Pg7B4/zsYnSknKPCfZVhWZBpwUu581FamvTqO2mIDkqHdQq2zyqWz+nl0/kHg9s
	l9GFlt7fboM6UbRxRlWhIpYZKe7G6fHEVNL6F9BZdLShKCRjwLhFI+BjlDi2kyg8xqrcoQGuyOZ
	1LkdqydVKNL3vrKlvBMHE1mK/7duH0SoFdiIOBcPSQo9sXVVw9MAjwtQQ8lnwY00bQ==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
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

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.
