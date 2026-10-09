Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45C3E1688
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534773; cv=pass; b=J9gTdbKEb/BX1P+Yh0ML1dsHyxwatNQ7d/bduitXCDFN2Y7EAy8v3p46NabO9pDNErVwiXNZVgzbRW9bJ7AxJ64/pgt6WZMaJKxzhlILkC1VN3dXgyOU5UK5rHoFcUZR2NMI4/nzWul0vSluukRDMY3DaihI6eHNIIybmEDQdrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534773; c=relaxed/simple;
	bh=vzYaCJLBbyPc/qFbHDoIaROvXJy7u93JcRAj4Zb3tZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkgzkZ0xC7EP4xF3Yhrrjhv44YY/frTq4x6eaXxQH+JMm+NAB5Rw3Z2gcRetVXQTsBOWnIzQdAk2yGAG7dDzKMuobh1HRG4d7ZL6IzKcddSgiHELo/45Egu0lB/5x4+vws0lKmZC5RxGNnXLlGkXCvX2xBb2ExJHW5rufL6vGQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpcCrxLU; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpcCrxLU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5378b281aso22994595ad.2
        for <linux-leds@vger.kernel.org>; Fri, 09 Oct 2026 01:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791534772; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXigqnk0jNUC+raF29BBnBPBVecYTdtxb6c82DpdQLWSaZS9TBVdPqmZ57s94vBiqk
         2GpdqbDj0w//nevuYgW0sBsc2WgPMKkCFs6qJ6/QDBpfw25HWRzfQPQ9VQ+uHmbXUfP5
         IUNy5WrKJTSOZG5d+D96sMQ5lUcNrCTiUS8uareRzaQVEzjlnI7BF+Y2jvczKYOWZoDS
         juXizwgNmEPWMM6xYkGMC7BBR1d/+PxB/Y/c09XOk8TymqlEwqzT5uiou3yhzU2l4j1T
         a9CZENNqSF67ozEHLqg3FT7070+OufUqalg72SeakhTxPNBVsTLZTFBUBFas70o4gRuC
         KeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        fh=n9RYIf7qm1aCNq8umyFVW+/BP40Gk21gU7M9xgIgmeY=;
        b=r2YZS+UNgz0mIyBd4BMhSO4l+xrKbHdQ0SH79f00V5UnqG8Bizh22gabgcKLM97avZ
         mu16PecUr0N3RkqPHkxNVwFqYYCnnUiKvFMcFE+RSAw5ANzCySpCw05xml/078GNrAfK
         BQKZKws7AXH5SVOp8AK4u1Ucf4GNQrZ5qPYeeGb5Xi5ObgFO5nLEGSx22ke+S1vX/xCj
         hkHlt2lGsVU4JsGA19GroINzw4e7m7tU67a2i+dxn57wjlVtrS+kXQI7Us6heqsbIChh
         Wt1NwdVEdPKfyjV8jTr0dR1U8TRjYcsH/KqF7gSpizo+fD/EG4n6dxpEi5HTMhpYpN/5
         dymg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791534772; x=1792139572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        b=SpcCrxLU/2Wo14cMqJ8AHsFV8AU64ypIBG9r11dgn7ih77x9qGcdTfBFex9sW58U4Y
         NDh8oOq86OaPYvCpzj4vzxFG8XdM0zKRCyLgL4qSfExMqcDCcUta1ycpbpMulBaP3+lH
         st0DoEz0r6KlvxFQI4i29kD4LSnoNtZ1rZYP3Em098XTbt4tr+gZwfc7MGm29R6kzLv3
         Vh3aAXUipAzy5/ehZFUHdDn91AcD95pRNeNTkvDSi4D/92Yc5chnMeg8wCCiKw/MKLte
         wz9V/xW6uXdwOKs2sq9ZUZZ6Yr4e3k/VFLxZeWr+mHRcyYK+mJqbe4wiqFNMuY2DhM03
         lnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534772; x=1792139572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        b=SZHq+qJgbW2V7KwBv3Td1M8Qc5lrgXSz2jyk4V7RwUKr8hAvnAwvuzXAK/9qFgFkv4
         iEcsJuXeYOPmJulbS3DKgwi8K9aMY/CjJYEpN5jYFlGRfmuRoeegJ8d85RTfLvQBtnEp
         tpi3BIULsmTGbeffqSIf3zA7m2ZXHwl4VrCraIDvL141ADIqPoFwXSQBTgkXDnDebR+L
         u2Lo3bLzbUsZrWa2QM3/N6jRwRMLeU08Bggc2FrPiiguzxZkV/PVwJWX2Ma+HOpgR/Vg
         j+oTaxu8EtOaCvWCH7SsC3JfdPEcl/6YQaMhn5mbQ7h7TLFKwYMlFheyTld6vAbxKLM6
         gIpg==
X-Forwarded-Encrypted: i=1; AKwUvBy/xVQsEkOfhckUz3LiuVUaAeotRdJIG8eGAjL85pXDb+1oyK5YfzhuCUYpXYYb08878eAWCcvjpx+z@vger.kernel.org
X-Gm-Message-State: AFq9FYLkssS/6a4UZE+mbWl7pMYqdMRBl4ifXyM+zwULn0+yRU8pxHg5
	69/owekNFC5Bzij3nkWOz2qG+7mJSTOD2rx2aQ7aK9iOU2xZpMLeTaqvpu+9QKNaq+kPhvqyYw0
	0notz0nri6EfefhtEcm1shGHXbYoaY0dZaFxj
X-Gm-Gg: AYBFou1+dJDMwI6BtKnUkMm5V7zkmGMrlM+j5WOTSK6tw8HU2GikfzJ+rmV+JG8eOT8
	XzbNCzvvuyDtlnltCRdUrI58PDMtsK+zntxwTVZ93mi5AwzNnaXU22hJ0LBWjjck+fabOLtMIhY
	xFVlxA70dc2Ph6/OK1mXGHS+k2f0ur28uAye1/IqpqTRje3n8tjskRauuuyXrBHwEzYkQuR2geI
	JtomMuMX6BOXsFv6sDYwDr/y+bPEHNHyEDYj8Enwe3nGBPlXYpDscXtf2djxBuidF0mCEwbvOe1
	xZjGVCBKQIy//+HXg4GfRcL/6NvWSt/qWs47QUgVAMEhcrttagt+gRaDQM1az8zkq/otGl4+BtP
	dTJKQSwxge12S7Iv0+Mfp1zVDF7OVaG926VFgfbGy5dAKnk/zLLVlteyL5Sez5aeU2ZzW88dj0B
	ViZw==
X-Received: by 2002:a17:903:950:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2e842cd96d6mr10150435ad.40.1791534771859; Fri, 09 Oct 2026
 01:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104915.507801-1-phucduc.bui@gmail.com>
 <sashiko-outbox-162904@kernel.org> <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
In-Reply-To: <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 15:32:40 +0700
X-Gm-Features: AclHuK8XN9K-ogLHtFEL9lYrpTHkwKGuJrAfKNgnjUZ1GrmHQNgZd9i-U2aNpMk
Message-ID: <CAABR9nG_Q2+cEBubvZAvqJM-voO6Q-GxPTwYOSi-U=C4YGu0zA@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3532: propagate enable GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > [Severity: Medium]
> > Will this change result in unconditional error logging during deferred probes
> > anyway?
> >
> > When devm_gpiod_get_optional() returns a deferred probe error, dev_err_probe()
> > correctly suppresses the log message here. However, the caller lm3532_probe()
> > does not use dev_err_probe() for its return check:
> >
> > lm3532_probe() {
> >     ...
> >     ret = lm3532_parse_node(drvdata);
> >     if (ret) {
> >         dev_err(&client->dev, "Failed to parse node\n");
> >         return ret;
> >     }
> >     ...
> > }
>
> I will also add this code to the current patch.
>
> --------------------------------------------------------------------------------------------
> ret = lm3532_parse_node(drvdata);
> if (ret)
>         return dev_err_probe(&client->dev, ret, "Failed to parse node\n");
> ---------------------------------------------------------------------------------------------

After looking at the error handling in lm3532_parse_node(),
I think it would be better to log errors there and return the error
directly from lm3532_probe(),
avoiding duplicate error messages.
I'll update the patch accordingly.
