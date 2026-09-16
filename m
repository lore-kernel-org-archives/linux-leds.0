Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3451D531
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568591; cv=none; b=bEjvomG+qHj/NaYv91U+K76RSK/UaPcLZvDQ2naiZedFTr1Y53AB/GRVfZSxFZIPZLj6m9Tab9dXT9IgC64k0TKTc/hKab4yGese6JRNbAKtrVy3tojVPN20NgBhUigJaoDXhyJ4wtwbXE0aNXqyUvhuqegjmFu05AEo/Px1zTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568591; c=relaxed/simple;
	bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YNBg52nanAHhoyBZ1/lvO3NA4rAVAciq+8iMSRqi1id0/VdzWAd6hemWZnxWKL0YeQZVC6P17o9xKs3NX4p1EgfGXhzGIAmPWz3OADOnGNXjUo/gIxACJEHykjEM44cPTGUdh0QebkUwHlgpMld3V+WFPGULtZlt071PWN8an9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qj9pMIEL; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj9pMIEL"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d20963so589195b3a.1
        for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568589; x=1790173389; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=Qj9pMIELu9/Z7qdZgggoZb49QLwcDo6Mi/KtnwMKoJubDdtRfKr82a78NUEEidapOU
         gRdoKNBFCBB5Rk3NKyy+PIDtZ6FQber7z2p7Kxl6TFSU5PwAX+6UsZuBWZVSRumVO0l/
         0dUxkfDWa3LdJnGqRjpuhlXETL7WG766aRzpKFu5vybcBQNiJWso5MJQDa4/+3kPKI0A
         kcAFVzIuJ7KSj2CNn1f2zRAU3Avyr4L7oenmLccvb+CLxuiKxRjnaQYN/mQIsypS6l8h
         zcPgnM8Ibh0qOHiEc4z2sJUDzvJ6r1lmdxDBXMGU2X3s7zA0i4uHe/PQ15Otit+0PZcT
         3/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568589; x=1790173389;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=U40hr+4MmkzGtpb44isLAOVoxysf+4t8K/UlVb+7u7eodkSsNYLmno2OEKfuqHDOu5
         N0+AMpSPKLcIWIU3tUsrq8eRV/hOtmoSwzJEioV7SPbeo60kAYxwNqj5AuMdsZ+YMXDB
         HItMf7sI0qv2OWTXsiGLKnbe9Ohbr2ZCxp4RfTnWDst5voXCngo3B0Jn3boRwzbBCkv6
         atF0MaFv+De3sUdxH1pHTOPLBKOgwxTpXAbnGiW12AEkDU0mtyTBhiLH3NY/PGP9Vnlk
         F62UwlJlDL0OGemjNb4Yv9RYFFKZbTd9cT3awAQq3Owd4oxFtaEyMedJkkJSMJtRCrMT
         33/A==
X-Gm-Message-State: AFuF++n9A7eY27NyLro7ZIng2w/1RHvwStAAlGcjNcVqzJxV+wtVp9lZ
	HqR0hiwBWAkBfIPor0LYO3bn3cOSBYvTN6Fy5M65y5d/6/U0FXpAsEVo
X-Gm-Gg: AYBFou0HsoCdlhvXAgRrbmxZAwVBdRkKgHzJ7s1b0OYwrYCeYQasZNuHfkoCTuhSp1J
	3DbDDmWeYwxZrPH0x3zPtXDKb1iU+DvbXHAxgNl8pG4EnNnwJv4DFsagFQ0vLXCP+lWwQg6OZu8
	VtBtX4/6oBNeS1ILIAZWTHKh7npovokL0LiwaBZBZmeNd+wYzuvttWa61qFVqGdcZj6MANfr32v
	dOUJcmvL29G2A7IwBJc4QN4NaLyanc+IIZlmPXzMn9B4tKP4xQ/44BDremDAeRCXZvcbeOl71/K
	X/t8QeoHx8201xKtk5/xp22Eic/RJG5E6zEU2HOPM/9aSBr4c1+Xa+dYm5jrtA7m24IHTiVriHr
	nGgjA2nDHdAlbShc9loubvAYPxeuEpOomsjO/JKYX0qcwrpfoaMPsqUFQMF/IYDbuIZAebbt0TK
	5eFpdAPNjUMKB3vtMdO5K+47JDogLVMe3G0I2KcnbuROQqa53eNIFjrVSNdBPggg4O6EnRbrQ=
X-Received: by 2002:a05:6a00:4c81:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87238c81c3dmr5081392b3a.14.1789568588753;
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d179aesm1390884b3a.50.2026.09.16.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v5 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 14:23:04 -0000
Message-Id: <202609162200.ReplyLee0916b.lhw@gmail.com>
In-Reply-To: <20260916130602.GS11487@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

On the three sashiko items: the naming one I took as a fix. The doc
says sections that don't apply are left blank and shows "phy3::wlan"
for that, so v6 uses the empty color section explicitly,
asus-arion-0-0-0-0::led-0, with the "-N" ordinal the naming section
asks for when several LEDs share a function. v6 goes out as its own
thread.

The other two are the same false positives as in every previous
round: kzalloc_obj() has been in include/linux/slab.h since v7.0
(this driver builds against 7.2), and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. The bot's reference
tree looks outdated; is there a way to retire these two from further
rounds?
