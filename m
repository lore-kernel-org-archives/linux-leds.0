Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0065B152E1C
	for <linux-leds@vger.kernel.org>; Fri, 13 Dec 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107745; cv=none; b=PV10uUSozllRiVAOIv2lTBwCAyoTH1rQGcaN71BeFZdnlRzZ2FKuvIEisn9icElioed3bE0SdewdcL/BA/oW4hs9n6SPRmAJs2zAzbLrHG3N1Zozt1jFiAwCTbZFAwQcdqQR6hJdnHGyRZsl6ZLEZVYoAyzm9FWPFHqDu5/hbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107745; c=relaxed/simple;
	bh=scLPu6zwwblcXgS38MX8MxfYsMx9Frw6zMTDTE/KB78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3JIrPIbaBhwVn9xqvrZJ2QUr+1GJNBET3ITIswzJdxX5PxSJ+saS01Ag5qB8y5UQrIIXrNaQhgLmkJnBTMT724RcVXVdCV3Cu1PiYDPJdybye/ko9SgOOxgjoWNBK9dNA2NA1WsHJT8Fu7ZTvTvDkU+vJQbrzpeS3CGYJ3pK+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sesZ6Ktb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sesZ6Ktb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1384C4CED0;
	Fri, 13 Dec 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734107744;
	bh=scLPu6zwwblcXgS38MX8MxfYsMx9Frw6zMTDTE/KB78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sesZ6KtbsQ2dRxbfZPQphy/+jgznJU6Y0GA+VEodI2Py2sdufBEyiEMK9vuWTYa8e
	 3xE5/JTkEID7Qrgg4UkZoXTPXYIwjyKOWPBpYxoRlURXV86syKwEk2KDkMt7C4WoAz
	 6lCv57bcZ/RWAGpun+2LKD0UbPISIsCbiUnvqveO6hTrG9o3/xmn+UEb3bOTS/EUFS
	 YeY3eNnjEo5tE4ScsDM/hJtPgC36+RP/UBoZ+2vfwHcvI7u4gAgCXH66BGPyjRZnDA
	 bdX/mMsewP51p+DT6hBwDD9VoqnlK3QKA+AIpvksu0W9LitgIkNq9nhmLPUukLaI+T
	 BqYCCMkroe4cA==
Date: Fri, 13 Dec 2024 16:35:40 +0000
From: Lee Jones <lee@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
Message-ID: <20241213163540.GB2418536@google.com>
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
 <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>
 <20241212190407.GM7139@google.com>
 <F60FA21FC28E019E+90aa034b-2edd-435a-a4c4-17910267089d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F60FA21FC28E019E+90aa034b-2edd-435a-a4c4-17910267089d@radxa.com>

On Fri, 13 Dec 2024, FUKAUMI Naoki wrote:

> Hi,
> 
> On 12/13/24 04:04, Lee Jones wrote:
> > On Tue, 10 Dec 2024, FUKAUMI Naoki wrote:
> > 
> > > Hi,
> > > 
> > > Could you help me(write good commit message), anyone?
> > 
> > Surely you know what the changes you authored do and why you authored
> > them?  Write out a nice description in your first language then use
> > a free online translation tool to convert it into English.  It doesn't
> > have to be a novel.  Just describe what you're doing and why it's
> > needed.
> 
> I have no knowledge about electrical circuits...

You must know why you made this change?

-- 
Lee Jones [李琼斯]
