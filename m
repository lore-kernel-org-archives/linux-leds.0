Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CAE4A3417;
	Thu,  2 Jul 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999698; cv=none; b=YH+QP4oBSoZM0YuGla5keSJxtmadDx2fSqCaQdYdga77/zuPqN7uEMc7Wt5GzrsoaAJGk301KgyEIZGnBEigqFYaeC3oeA/WdTQncFb95Vu9p7wBR8K9wJIhdRI05hApoWb/9x6N+ape4lB8qIOGtuokq56GBaPvMaEqlf2inao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999698; c=relaxed/simple;
	bh=2q8Lu7ZUkRh+48AFcfk5cx0VE+GkD1QAUrI4P7Z0UGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFHIk4OhJFFazmYpzTlclAnIPRxIC6cvByCTKUXzoPfCzvihac6FqfMbwxbXRjecGvNPoTEJ2+u9pgPZrRul2UC8C4CC+dlxbXwLJHK8AzitiaYZp02Xy2+B5WvRuCcnATsX/sz1d/PsNItgu/r+1qqo48dg4IjgDOk0VsbDsWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7/MnzY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7/MnzY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB0B1F000E9;
	Thu,  2 Jul 2026 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782999697;
	bh=r/QdX4mWyc91WzptPvKcbo2h0yzYVAmzk5WLcMnBpJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7/MnzY1Bby+Vhkz2np9pueKznFwotVexX6KJVBMCVWA25RTCEN4jVk7BB+UhO4nr
	 D2mmSbPmI5Sz6LSvvP3CAXCnKmEtbCfs0RzeCyszO3+RPjQ8n/6jUZwSciILm6IM2y
	 Erj++7+tyf16pBemYwNo9mo9kFNDApqxmy2hmz3Qwdw+v6velxcDCsbs7rv2YLnpU8
	 qK8FAaMe8+INgdh7jojV2Gi+ruyFefQWeipLrfrOz7cAatPTruFKNJ8suGW5i7N4a/
	 7ItfhRfEkgH6AJYiWutS7dS/QMkkbbWtuyOsu5FO+kuT903cKIyzu4rGUa1s8jNVgE
	 m62y8m8HBSkTg==
Date: Thu, 2 Jul 2026 14:41:30 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/9] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-ID: <20260702134130.GN2108533@google.com>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>

On Thu, 18 Jun 2026, Rong Zhang wrote:

> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space cycles keyboard backlight levels in the
> following sequence:

So we're effectively lifting something out of netdev and making it more
generic.  I don't generally have an issue with this, but the idea will
need more eyes on before I feel confident enough to review (for my
own little quirks) and merge it.

-- 
Lee Jones
