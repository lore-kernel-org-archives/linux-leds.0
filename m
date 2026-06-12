Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1036AB4B;
	Fri, 12 Jun 2026 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287699; cv=none; b=e/QpZbr5Wa6eD4M+veFolPC+irQ4fFeiLESfHvL41kZb1//ppyyzUE+sKy2T4KKxmpjsbLNuI8vSJ3IVFd4/bCIeFNl82kWW0CTMYEnLULMAfyxZbMXm06rEA3uUagr2OtL0AmwjJVexESjm+sptcjX7Lz9k115pPvx6I0Ry0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287699; c=relaxed/simple;
	bh=XdDF6SesZR4kGgKugTy+AKxjk7nrQPAOj20/IxMcNrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I91mIg9S45zgFOEcsQUd515t5vubPbd9tLUV98ClQjVM8bYW9JQXZFHP1YmGPaNMosf4gmAFcN2XjKnAmHH1jvAGvpy547YpbkaJV2ffDcAjI6KnEjkgeUtlOijLHeAaSqzeMnG79AgrTW3bLfSdzNRa3ilzJjMzPgq2Pk3cpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=v0OsucTp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="v0OsucTp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=RxanrPFArRRTRhc509e3INMJnv0i0H5CfoaJiHbkTLs=; b=v0OsucTpFwXQLP5Zb+T8+gUSfe
	sXyWmVj1EzhFt59eM051pYSubB3g3CD/+SmJN1Yc951HU4a1vtuvE+oDv7OAfctmQcJxSSS5qzwWO
	u7bvw8E9o0eqX2T5qgNJsLZLdnUpzNhZdEFaAlGFBoSFEfrWIiXJRZl5emhL4XQvMmEDBx/H/3kUi
	j49S3kWQNekX/qIp2Bl59HGx0HS+izULLeYHh3zPy+qiUNxsjPVNs7XN8b/m62+o63rhGwAs3QQVR
	tnPTDYzC6Qgcry6cLsvOQgAfNhiJh+14UOdm/WhoLs91rRnVYPZQO+qyR65tefd0BuSCRQ3XBTjib
	O3piDuPA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Ih-0000000BOfd-1T6K;
	Fri, 12 Jun 2026 18:08:15 +0000
Message-ID: <25fc60ce-5fc7-416e-bec7-d7897d84c038@infradead.org>
Date: Fri, 12 Jun 2026 11:08:14 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: leds: fix broken reference to the
 multicolor LED ABI
To: Shardul Deshpande <iamsharduld@gmail.com>, Nam Tran
 <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612171528.728111-1-iamsharduld@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612171528.728111-1-iamsharduld@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/12/26 10:15 AM, Shardul Deshpande wrote:
> The reference pointed to a non-existent .rst file.  The ABI file is named
> sysfs-class-led-multicolor (without extension), so fix the reference to
> match the actual file and resolve the warning from
> tools/docs/documentation-file-ref-check.
> 
> Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/leds/leds-lp5812.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
> index c2a6368d5..12e757d45 100644
> --- a/Documentation/leds/leds-lp5812.rst
> +++ b/Documentation/leds/leds-lp5812.rst
> @@ -20,7 +20,7 @@ Sysfs Interface
>  ===============
>  
>  This driver uses the standard multicolor LED class interfaces defined
> -in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
> +in Documentation/ABI/testing/sysfs-class-led-multicolor.
>  
>  Each LP5812 LED output appears under ``/sys/class/leds/`` with its
>  assigned label (for example ``LED_A``).

-- 
~Randy
