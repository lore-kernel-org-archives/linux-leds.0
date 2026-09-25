Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70548124E
	for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2026 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340335; cv=none; b=iEPiL+fKEO1PUmQI86zr/DFiHYCiD7blqe8qLAQMjqaIjEVy/WcIpnnBmZjCLOEWx2oaB+Ey+NejBY46cDntMoHRbj1KiyRFhvBoAxu4fl2mxg+PGZ70L/R3zheH6taoY1Y2Na6qU/YwiaRroR+t7ymTT/KOspnvCp2MF3gI1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340335; c=relaxed/simple;
	bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ApDjKyVFnn1Y71evFV97sKYZne0SqOaYfFDCr8sn3/mIZ010DONRCtneww5D6zcek7cGn/JGt0SRMJ4fREiOW+zXVyTzKTQ99GzqD2biR/mDzU3G/iJ/H0YfRooNCKNENSSp4jm70kn/HNDG6qLaiZ1DwzAH/2zOSGa0lM+Loak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6NtYUhm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6NtYUhm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so5764565ad.3
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2026 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340333; x=1790945133; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
        b=d6NtYUhmEivD0ZQLyNxSandbOrwvkwlrGbo+V11M4s7kf9Txm0V5G76KIsoqmvqA7W
         OsO/s2MkuRFteUGr9Xgc+g7QoKVfRSig/gWH0XJ+QJTadw21vBjR9QgLCcrpninMQPUm
         kkQIYgB7zVQapJAlnhk2yQYlILulMhkOolL+jp9qnl8lCHLciDOUeQXw71dlnygVpcyJ
         S48LE8TUcOBUsk72cESgPREItBFxZh/G4XpMv0PHldfsgC4/zGAvUK7KQBxivjPLxmbm
         Uw6Tlrd5YwxFOpvrmb2heoEKEOIVgHug0lMvUDbaaBY0G42sOy/474VyCH9ckxSPXZjj
         hLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340333; x=1790945133;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFBgM+h9vwcAXQ6IgQ/0PgarYfhdhOwkRrgF8syo4DI=;
        b=RV0CUqwGHMj90Dq3D1zejU/ZUerBcq5ddnlJYuOPXGg4Ja9YCUJGkjpnBxcPNMVbPx
         0jIF1HsIFoO/eIxLuAv5v49mGETNdDoD8wODuLFEO7F1tDq4V1FfJZhinf8LnNSHnpiG
         oBWC9g6CaRtID8cS1FTqLLL43eDf0YUW1kQR1Ug307uMBkGaghrj9KjRgvqbQtdObRAS
         wVBcfkmIXchd51Q+53Eyjk2XvxKcvKDbdqz440gluadvoIsiqTZ87RN/mqrnyNUnUQQx
         6nhPprZYNvEikbzJ2Dyg3pLnB43M3CTofbYtyGRUrRemuIpJWBh+RKyq+qZCputyQbcw
         i/Rw==
X-Gm-Message-State: AFuF++leh0viRxYCE4ycNFGL30s2xNDiNWnT42foyYvvZ5qjrJa2+t1t
	6kbLIaqxz9IF0RldEvUGtsVRjIOBN2LtqazGzbfutIR7Y1ojVvhW0Ueg
X-Gm-Gg: AYBFou1yV+VnkaACWPLqrIObaLxv+sxq+cySXGL4LQHmaFy2pdIHSDIaU/7OUyKmRrY
	I6lq/6KQ07hFmr9wq/hB4PiAwrkdcjZWnuFygkpHYN0fJPQr8pcYEwdFlUWUTWgrnFbaBMbD0GL
	wVPUXWng6OTws9AkKtoYT4VV5kIqPnaklALJ1OuJf9DhlKFxhK8LbjDhZu0t6VdeudDKEBfE2cU
	bl5G9xGYDCqdIDtgvjY5s9fgV6f4K9u3N95hNRuub+LsFiKY9//He48yw9METfg3IMy4gxsOA1r
	LxdifpCeXmORi8IXDOs7AtD6jQo65FxY8LRfxqI4Fk2X3uEgKWtZUHtk0VKddQ0pI85gFx9idSw
	iwxQvx8FDd0i5hxrntVHbKQ4S1bksT5ILT3m9gjC2Tv+mzmhaxFoMuztZJLF8/Q9BGDe/ekRqmV
	G0eBOPrwt1GV5GCH9hQ/GLqlz1pElzO8XMPh392NRlcPBVLzOLs7EFKa61s1+oeaTeaGbs4w==
X-Received: by 2002:a17:902:d582:b0:2df:98b4:c294 with SMTP id d9443c01a7336-2df98b4cb7fmr9983615ad.61.1790340327930;
        Fri, 25 Sep 2026 05:45:27 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfea3sm9261685ad.14.2026.09.25.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:45:27 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Marco Scardovi <scardracs@disroot.org>,
 Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Fri, 25 Sep 2026 12:45:18 -0000
Message-Id: <202609252118.ReplyMarco2.lhw@gmail.com>
In-Reply-To: <mTEVQW_BRQmYsDDsTddE2A@disroot.org>
References: <UuqOxFagT_OBL0l5ZYtfKg@disroot.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Hi Marco,

Understood, and thanks for leaving the SCSI side with us. I'll pick
up the dynamic class integration shape from your dropped version
and rebase the LED side onto the class once it settles; no
co-authorship, noted. When the SCSI driver is stable I'll post it
against your class here on lore.
