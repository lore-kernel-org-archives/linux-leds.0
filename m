Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B486136
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299365; cv=none; b=NENzZFVwIK1DMfQv/HMtCv3GkcolEewCc26Txy3/YvxxYW5PbLmAAxe08e7qzekpSpWbrXkUC6hxfF6JauvKY3CTNkIYMJPSmTE10L+aXE8OQFVgLxNmXlO3HnkA/tCdqYpMww9q2Rzzj82JprtGE8d83zE1DCXZpzvDFX7JOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299365; c=relaxed/simple;
	bh=gS7zQ40ZULZztsQYZfjYjZalBPlOH7ApoNf2JdPNE68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhG+lGi69bQEdAYPzksDiw/UEgf+3ISDEFOvqEaRuPu7bQxEqOBgS0VmDXUGEQ+hSmifwS/crOCBzCKFkRZoLrL+zQ5UWfnInH5zZPjqvqr0fwZ8VaQDlBGNlmxab/aYVjPsQSPZWaIoaD76IQGPc0MAbzfX1egc2xU9CH/T8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFxwfynV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFxwfynV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26079C2BBFC;
	Thu, 13 Jun 2024 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718299364;
	bh=gS7zQ40ZULZztsQYZfjYjZalBPlOH7ApoNf2JdPNE68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFxwfynVDgKGifbpyRZq4gF0zd1vQ1t0PMWxXPLjfZdaZMBgEtAsymO9FYK6C8USj
	 ji0b213nmL3HLpKINXk6zYXeuSLKPTZePIc1jfPwUjjrNMj3+Dj//a4et1WZPpm+Pb
	 tkZOef4watJQ7ydU7+Q+La8qViAq7E/WMDZW6BddJl0tlDLfnBjjHzkK5KL/GFuJzK
	 blcvQUHVInVdPN7hSLF2KTxGAZ3ZHtEN2+q3a3L4E11Z67SUuKyQahAcYtvbD4XKtW
	 WqnU/CdBNtiJJ2j2rREE0QAfEhtKIXOoHp8FJEB5b0t/c59A8GIzTOWAM5OjPlkgi/
	 fvOPRPIsglIDw==
Date: Thu, 13 Jun 2024 18:22:40 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Joseph Strauss <jstrauss@mailbox.org>, jansimon.moeller@gmx.de,
	conor@kernel.org, christophe.jaillet@wanadoo.fr,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <20240613172240.GS2561462@google.com>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
 <20240531103840.GC1005600@google.com>
 <20240531232031.u5mphuqrwin533rj@libretux>
 <20240613134933.GC2561462@google.com>
 <Zmr57Iyd9UHWUYy9@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmr57Iyd9UHWUYy9@duo.ucw.cz>

On Thu, 13 Jun 2024, Pavel Machek wrote:

> Hi!
> 
> > Pavel's for-next branch is 18 months old.
> > 
> > Use Linux -next.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
> 
> LED SUBSYSTEM
> M:      Pavel Machek <pavel@ucw.cz>
> M:      Lee Jones <lee@kernel.org>
> L:      linux-leds@vger.kernel.org
> S:      Maintained
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> 
> I guess we should get the MAINTAINERS entry updated.

Good point.  I'll submit a patch.

-- 
Lee Jones [李琼斯]
