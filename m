Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CF391E4B;
	Thu,  7 May 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154418; cv=none; b=C018ZDZX/jOyt4rCRTz6a4IAUWEBA4fJ4mgRQ5qOb89E6jwh50XxYA8vxHqF5ooi01FwJjDPKaO49S7OS9dystB1QUGdNGjj9QijwBfdWg8xphVnqWnvPNyZnxhAkPCjIxZTB4tAdC32rlf36XZR927ytEWBezA7rplJn31PmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154418; c=relaxed/simple;
	bh=2AndrycR0/3s6II2PM1BIYJ7I54IysIjGHD+SZzsOsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d2mG4aiR5IngigzKjsdmYp/RHXaBYKk+ntTTfT+1CpX1tMdYoaJ6CZ7RidLHisBu3SOqZB29WT90PzW6ZzH11J2rUbdRIpiKF7e7KfJOd+yNN7gF2QBqqMzppJTRNS2FH8WzpObd8t3uoe7C2TfIRdSrzrq8esI0X1aTUM1uNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtgBG7Sr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtgBG7Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1BDC2BCB2;
	Thu,  7 May 2026 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154418;
	bh=2AndrycR0/3s6II2PM1BIYJ7I54IysIjGHD+SZzsOsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GtgBG7SrZ+72JiBsGy1mf5PHFrkNSul7m5PgkQ8oY+FXpZFgjdQwPnuPBftsZV6VN
	 Ll1hWV7nq3BpPLCiQ9YaW2f5wZvSdq0ZJ7HlYOmadFcAruXNwin6ITDgccZlQDjbFT
	 OGLw5VJwX31nkXbG7MkeHYVxehr3eYs7ixV/pex13+RphFG25wWOGMJnicgKX6MB53
	 w1kiCDl7p3Mg5OCri+Xwdls4BpMUgaqzJrVRjVUco3bExzlp5ySsljwuq5z0XwxD+a
	 1IyXlqZ0dcye7SDW/RMtHc1zXlG0qQlLVAr6+vr701bSnRWXKcHOUQE2tbmFY/FRoU
	 reWHhbfgaWViQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Xinhong Hu <tp5092@foxmail.com>
Cc: lee@kernel.org, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, jkoolstra@xs4all.nl, 
 me@brighamcampbell.com
In-Reply-To: <tencent_26F6155ED10CA20CC65F62FD659218853809@qq.com>
References: <tencent_26F6155ED10CA20CC65F62FD659218853809@qq.com>
Subject: Re: (subset) [PATCH] docs: leds: fix sysfs ABI reference in
 lp5812.rst
Message-Id: <177815441666.1805014.14587236881098534018.b4-ty@b4>
Date: Thu, 07 May 2026 12:46:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 23 Apr 2026 18:39:10 +0800, Xinhong Hu wrote:
> Documentation/ABI/testing/sysfs-class-led-multicolor is a plain ABI
> description without a .rst suffix. The lp5812 documentation incorrectly
> referred to sysfs-class-led-multicolor.rst, which does not exist.
> 
> This was reported by documentation-file-ref-check (make refcheckdocs).
> 
> 
> [...]

Applied, thanks!

[1/1] docs: leds: fix sysfs ABI reference in lp5812.rst
      commit: 1f05106ff812466b491f2a8db752a06457878bf9

--
Lee Jones [李琼斯]

