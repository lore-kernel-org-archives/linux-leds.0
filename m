Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101510;
	b=ogkAAQTNrm7A5lJRrKLRA1nwMzGJeCIRtQYYd+jkI/S7/spMnpSq2kipFDc7ZDTLLFtu
	 dA0dJ7b9OhFfOAxZ520d6bDlyX36AvFNn71edlnLeh1rgrPfHdcAykTDcc/MXG+vwV1rp
	 Mu4h5nw1nKeq8hBYLB1aX4UhXdLcpgJt35auirVjF6IPP9p7ALuf+YUfe/Nzu4kXyTbLh
	 2ZlloSfOGt3dGf91DLvoTZhF3g9XeyFvnoVB0LMJdrhMp4YXowycwlat+bKntiVG0A5LQ
	 60A2gdtx4A84jNH4ICWR4jZTB35L8zFSQMn9dLuctrG/oXhLiNn44W6Pq26r+/Wj2/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IUUJPEmTzYkY3/TzsjBEJSQcE+ncdhB18Qrnxb2Dat0=;
	b=TApgyHGfNK09Ybzb5xAX8q66OokYsOmZk+5T8/f/m0MODtmghSGLbBBFjl+so0DKD57I
	 akQefFDlKLFiz8Fo1QbURyfgrh3i8k5P/O+upsbuvNOwQxmossKSc+DdhZlLGycF6SJtm
	 WY5QrX9wLz9DgX1RNSKXuSmyCWRxT68b2gBO8Ol4Dc2nKRbEK2nZMTsZpF0U+TkIRORRL
	 uS8ZzYlWT8dGtoJ6FdJud/RydxJ/7aFibV6xWKOXCcyiD+s7U7fOBeG1JRqoag5RRwZwY
	 LYqLRqfyxy8V7reDVsRpWs1Kmypt5elvwoY8MEhyrsap1h+J4HeZNdSrYi9KltvYx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Io/fEkl9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8A606A324;
	Thu, 19 Nov 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Io/fEkl9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4144A1F000C7;
	Thu, 19 Nov 2026 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101510;
	bh=IUUJPEmTzYkY3/TzsjBEJSQcE+ncdhB18Qrnxb2Dat0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Io/fEkl9qIE9/NnySG2Fi7/StYaODPKRElVGBpEPK8SEoTSTf419V+1DzUcHFdsRM
	 Yxbla6n2Q5w8ActHOIWt/Y6XKg8bojS7gu2qdFTdk4+eoRD57RvH0ImppukNTirrIU
	 MX5ExNksJB3TNQ7iRI1colUe5h6Q/53OMGbmcvSpyN3gpoWXGWnU8NISG2i3RuFL1L
	 mHvQgkoTlm7BZqKg7ZzuRhIh+Vx+XbTabEZgm+c/6Bf0rXbLUPZy6b52cXwhuZ4umK
	 XaQ2iUFDjPyaP/1h0e69L+evVn+2ZNOo1Vh47NoHVTX63ZM+xuSyhE8fZl2d4GMqta
	 XsWBNRcCDHiPg==
Date: Thu, 19 Nov 2026 15:18:26 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Zhu Jun <zhujun2@cmss.chinamobile.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: netxbig: Release the GPIO extension device after
 parsing
Message-ID: <20261119151826.GW98456@joneslee-macbookpro.roam.internal>
References: <20261112071657.154479-1-zhujun2@cmss.chinamobile.com>
 <sashiko-outbox-210598@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-210598@kernel.org>

On Thu, 12 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: netxbig: wrong Fixes tag for netxbig_leds_get_of_pdata()
>   leak

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit e84470b4e5048a49d0dea30c99c1fa99f03b9fb5
> Author: Zhu Jun <zhujun2@cmss.chinamobile.com>
> 
> > leds: netxbig: Release the GPIO extension device after parsing
> >
> > netxbig_leds_get_of_pdata() gets a device reference with
> > of_find_device_by_node(). Error paths release it, but successful
> > parsing returns without putting the device. The parsed platform data
> > does not retain that device pointer.
> >
> > Route successful parsing through the existing device cleanup label.
> >
> > Fixes: 2976b1798909 ("leds: netxbig: add device tree binding")
> > Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> 
> [Severity: Low]
> Should the Fixes: tag reference 9af512e81964 ("leds: netxbig: Convert to use
> GPIO descriptors") instead?
> 
> Commit 2976b1798909 ("leds: netxbig: add device tree binding") only parsed
> gpio_ext_np and did not call of_find_device_by_node().  That call was
> added in 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors"),
> and 311066aa9ebc ("leds: netxbig: add missing put_device() call in
> netxbig_leds_get_of_pdata()") later added put_device() on the error paths
> while leaving the success path returning early.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261112071657.154479-1-zhujun2@cmss.chinamobile.com?part=1

-- 
Lee Jones
