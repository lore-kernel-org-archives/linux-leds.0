Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BB4D9560
	for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645765; cv=none; b=o3yKZroUUjzOS3x0maouOqEOpVc7OGwdC9LRmKrsKe70DIVLdJ0RdEkAhUNpP1RN3xDfo5Pb6KBo707hDYzVA4i/KslsHxrFdOQ1YpxJ6ZPhHy8oeYTpIH5hXKw8nCQbgt4VDe6jayLp1IHz/1PJJZAEzFl7CmlU+ENmzMKOTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645765; c=relaxed/simple;
	bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LbLxn5u2Zb9UvOuRPFbsrOOf/auX9xG0zqnobknEGT/hlAv6f2AydNR2sOwT9mdLNqWDqYKDhSP93GMsos+1Z5U6EURSBDIhtVjCWkNBugDpHfUOeaWtWG4NPT8TK3/N/afmPmpXYhYMuXUv0Mt1vfBPd7w6p449w5T4jcC4qbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9T1fHeq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9T1fHeq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso474999a91.2
        for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789645762; x=1790250562; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
        b=G9T1fHeqBOUEsUwv3l1dPHfBiO8S8BBCxTVbu/ubqglD6ictKxG3kur9h/fUMNvHX5
         NLfZtOJkwWauOPOIGZmpEpZ0xUT4LKyAqRHAzz6+FFsbdeBu3+wDGdUPAkTBQBCV9yOH
         pWkVhffMFPjSRwt7zFX8J+0ZfdYqUAkiPN+P6LB5VxZD/NJ53AvVthbK0CKwsa7xMQOy
         ED+RIKsJ7BGfcJf+uiHLBnEWODtFmuwVX6/t+KIjNr0p3JiTbViFNotX1TsvQz0eO9Gz
         KSA8rEYn6gEaYCjyzViEcU7ba8sJIxfoa0pBVW5f+42qmLUWvmUYzydwllBdK+oEzJfq
         GvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645762; x=1790250562;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
        b=1uemk+YmCPEIVLAVWdciSfE+a0dVxRPQ5hE1xKbxEkwKzJgZHZS0+uPzBZqsX+XMHe
         Uipmjb4d1cQzkt7emZbQ6uVh+dTQuL5x8dEUtVNir9qeDweyLTBmMP8auJRqY8Idk9YJ
         pwKOJTm2/we7piciBw1pAZFaia6m9nTrH9llt8AF/pXBcRCApZntf0rVbawkIcoL/JA9
         TUOPV5zlqUUQc13yyQGjGRQtQ9ajUwdID4e/ftLTuyzJS+MjOoPU5G5FgL6ISnoxYU51
         8cx4MFUb5a8xmrcs4wkD408qIfeL6Igg1CQP20nO/DUtpx4RfpENffpZiNhvVWyK06Jp
         DrYA==
X-Gm-Message-State: AFuF++mTEc0eoi7Gz4i+YI7lAsnL/ojGPoI4bXFK2x0t77cD1T2KH9Pn
	rtrjiiUJY0FpQ/+T6QSFCqmYWpdv2QKRTSZ41XxLKNiGXJDQsmgHcWEi
X-Gm-Gg: AYBFou0orblohbx8Uw/l+wDrmdomipmDTj2EcnuHlOfOr4tQBiSypvwP+gwZCaW7zFx
	T8rtdJQxy5L8K0Baqc9LeaJ6QEOT0m737I6IBnXrTe3SaDDPaZEzZFj9uiLUy1PrGefxxXBEEA+
	azsLwdDX0rk+sREGoprsR19Q4GH10tiNS6LySNQAokzMQ67bbXTOMCjOEtKpwLoRfWqMFQ6A5SX
	CTv1JFkiaaX9ckteWbG7YF91jCYGoxKyEJGaCEnwLQ4vGV6tLQ5mUJShhfXAkcE+dX91anp8ftu
	bq8WO/fgFvDKBgP06+xdRm00XcXXMUOw9UzJhJuaDf0DgZtlAUFcm8zxHL9uI/HstHkOCox39vc
	yrep8fkNKptn482e9jghNHWH2NIU027UDKLpywWZwwxL62Ia9p+q64VCpuM7NHO9kzuojmenx7D
	MxwP0mwpyx7eKa/aovWG9DSuJfFEQcgJ/hj8FEKy4aIfGoiwJeOU/wc+qKZZnX0Jka9986mw==
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39e1df7d64bmr13875098a91.0.1789645762177;
        Thu, 17 Sep 2026 04:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39b0399bsm1178502a91.2.2026.09.17.04.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:49:21 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v6 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Thu, 17 Sep 2026 11:49:18 -0000
Message-Id: <202609172115.ReplyLeeR6.lhw@gmail.com>
In-Reply-To: <20260917112840.GJ1605367@google.com>
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
 <20260916130602.GS11487@google.com> <202609162200.RFCv6-0.lhw@gmail.com>
 <202609162200.RFCv6-1.lhw@gmail.com>
 <20260916143832.520721F000FF@smtp.kernel.org>
 <20260917112840.GJ1605367@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

This one is the same false positive as in every round so far:
kzalloc_obj() has been in include/linux/slab.h since v7.0 (line 1152
in the 7.2.4 tree this driver builds against), so the bot's reference
tree simply predates it. Nothing to fix.

I considered switching to plain kzalloc() to end the loop, but
checkpatch on 7.2.4 flags that form with "Prefer kzalloc_obj over
kzalloc with sizeof", so the two tools disagree and I would rather
keep the checkpatch-clean one. Happy to switch if you prefer
kzalloc().

Both questions from the v6 cover letter are still open, by the way:
whether deferring the Kconfig/Makefile/MAINTAINERS wiring to the
agreed SCSI transport split is acceptable for an RFC, and whether
"led" should become a LED_FUNCTION_* value or the plain ordinal
function is fine.
