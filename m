Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179B3546DE;
	Fri, 16 Oct 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164867; cv=none; b=tGPTo3ptc7pUA3yzlC/G1E6gnXto2LjMJMk5MRFDFG2AUptorF4AupJzgZ8NhDZETVPiHOOOF+VtfNfRmPfUjgcp+hWfWGlxt5Ev8/psqpxCVuQ0KukhAzKDIH9XcxDQVkFqit/YbX0itc6SdHvLrKYoqTWBSEZs4TRvMJi04yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164867; c=relaxed/simple;
	bh=mlOYbo7iGOPtVfH/DvviYNz8oYevBD3I9W5NPxI7LIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp0qT/bmW05UkgnnQm7gKBcztBA2MuiCu+3n5l9ImrROj36FiMXfBD1XuP49Doler6XyFI7yd690DIVWtKIPvU/Q7+cpxSSlp5cVxOWH8Q8axZYBtN7w87i/e5vwcdon65Ib0MJ/zZrTuhMAusNcOMi6j3FKwDzLTT4LUsSG+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq64chIt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq64chIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0201F000C4;
	Fri, 16 Oct 2026 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164866;
	bh=mlOYbo7iGOPtVfH/DvviYNz8oYevBD3I9W5NPxI7LIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gq64chItWM79+NU7vbfsULvRvZs02ZYdpWJd5gtWM9hQ/vK6G8ZNTCfxYpsNlympX
	 AZVL08bpFK8zcru2oy3pA12DRzLdcQdnberdW/ZKd22HyZdYX7DDLlFdpRrupf5kQ2
	 j1jz3gKWvbdmrsxQxSFFnhlPWrLOdWYHMc1pjM/WiqnpwLcoBoOlbqslHpS8FpDmii
	 UHWoiBpGIafdYvcSmc8lIpruqXYCQ3VaEdGkq8P2sRCkNOprgGJU/66DWqZnuYInLl
	 GER3f6dMEhaJueejxDDaypLU6CvoByqaSUu71LUSo/gxS7yPHbimPEoul7/OMHhfWz
	 j1wutRbP2OFrA==
Date: Fri, 16 Oct 2026 16:34:21 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] mfd: aat2870: Convert to use OF bindings
Message-ID: <atJD_ZI7JyJY0PIc@aspen.lan>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-4-clamor95@gmail.com>

On Tue, Oct 13, 2026 at 09:09:32PM +0300, Svyatoslav Ryhel wrote:
> Conversion of the AAT2870 driver to use OF bindings requires a few complex
> changes that should be done simultaneously.
>
> The AAT2870 essentially provides two functions via child devices:
> backlight and regulators. Both functions are fairly self-sufficient and
> may not be populated on the final board. Consequently, the MFD
> registration API was replaced with of_platform_populate(), and each
> sub-device was given its own compatible string.
>
> Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> was converted to use modern gpiod/OF helpers, allowing the redundant
> aat2870_enable() and aat2870_disable() helpers to be removed.
>
> The aat2870-regulator driver was updated to register each of the four LDOs
> from a dedicated OF node using modern regulator framework.
>
> The aat2870-backlight driver was changed to populate all required
> properties from a dedicated Device Tree node. Its channel map was updated
> to use u8 instead of int. Furthermore, because the maximum current is now
> parsed as an absolute value rather than an enum entry, the calculation and
> application of the maximum current were updated accordingly.
>
> All of the changes above allow platform data to be removed entirely.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

For backlight:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
