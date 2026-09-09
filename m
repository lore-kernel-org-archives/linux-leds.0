Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83B37206F
	for <linux-leds@vger.kernel.org>; Wed,  9 Sep 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974823; cv=none; b=mnKgxJD1rw26KNeANDYFN90uEqCl+VUSMfe6bjC+gqYLKpAwiHTP8Pe9bdUIo5Z6aIMKj8Gb65hzneSQ3/+vZxiejNTEPPLqJNFRP7J1tFru9H+WsgMEMfL1OwnViqwNcdLfnAb4CFx9tIXBaEfjP4SE3KJvyrdbFz7qgbj47eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974823; c=relaxed/simple;
	bh=SUxP5gT1ZaOy4mmgP6chw0Cr8VRY83cgnbGtN/GeIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Juba0PEXZLUnv5bkxUONe2kx0MkAELpdJM4IJ6oA4Ev5GeJdzMl39vhC5tJ7Qktne4uw8wdBnNE+rZObQrIfWrZFZW+kMl9M27PAV8HW66VIDTA4EGjuCpuEssc4D2Wb+anS8tHuazrpTkfGsKMWUSd+azwpmLFh2ynnACbgodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI6Ly9NO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI6Ly9NO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-86265451beeso3290145b3a.0
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974821; x=1789579621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=jI6Ly9NOhS1CJVDcDoKjwgjST/iQVlVpolh/hifxBJGV2nz6t+8GlFWLZ4bzANtEHt
         /Gubm7aHSBwsXnEHDwS28/J38FGObVki5RAT4+MKtWxDxCzdeulLhOlDre6S80gl/1TC
         7EygHVvY8rB9EzbY4vuEGBvLIXgnThM7ofFVrmOOyUnxK3+Cw8/lUB1Qrw2zcQyD28sq
         aOwfF4Jak4nLrwlBRcrBmxMV3zq77fRSSDlQwIxXNAn/g3MvLudGjEbIzxRGELLjSs75
         zSMaaTiP34sWBjEuq0+gSjLhjHao2DyO1AI08J/NXT1fTMGf7TSzj1Dp3m+TJmQDgi3k
         TF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974821; x=1789579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=Mqmr/UK2DhL5EJzlJgKQD+AVz7ATpvjy3p+XYKUf/vRWVsxCPLtxSRIOGwxAemLSDr
         py8z6XznGXZoB1iqSoY1Ejo0Dbge4ldz6ytR8t68RHBGjE8GBQLeUe3++EqE6kna2eFb
         CiaBqORsM/dLYCkDoBc7yO9rao8EbWRMNtWZBPvjQl8BVrmLmNrp/XKiwRs1pYyx2EHY
         S5eGJDL+SSz9XzhKAajBIrxVwDCUo7Xy4D6mOnNISW7dTg1SOFUcf3lJ+sbu/I9vjdfy
         MBSAIlo+0IAcYhyGQtLfDWCE5v2ObYDTxkZhoiZ3cgALuNGoc9DpNsJpD3Pr8awmlndk
         5veg==
X-Forwarded-Encrypted: i=1; AKwUvBzLPPCQmwyTXH7rbAXV2KFTCDRAIPZbTi0H6QPhbYxFXGt12V2mmF+tgmvQjA6KLj1jxiQTD8dfyGj4@vger.kernel.org
X-Gm-Message-State: AFuF++nwATZbTHLKHsN0TgOapwxkW119rMA2e7aPzwgkSZUKx68Yl0vM
	qSM92Y2SZCFtmMAx3Nkf2E74sj6L9rEMB8YK9cbsYU7szaZSTjhDw3uy
X-Gm-Gg: AYBFou3kjMp/B7mErdFZ2QDEiV5ranIk8HSnEhxquqpDSKO9i6/iSEI+QxUEbJkzZdA
	cs9xaQE9qJAAoYeg7N2HfL+G2+MAaCC5jfD8HcTyrW/xAY+f7NViNpfVPgTNe+k0sjAUNFHSy7X
	MVsYJKS3NOOnrDOUFkX9GELGqI8NRajraAYA8l+EQwCbuY75qkUh9aRTOYEQc8KHNIf0sCrHenN
	kClNPHcGrIGB5vj1IycLLpJZ5ELZOkgAbxAz+UO7IsA5t7Q0cKZ+M+LrY0ygcTHo1BilLFapzGx
	bmMSXB2KRAuANoHhD6HIXeVEmM5sXG9N55UwpXZ6pi0AiTMV8SSis6iFcDOcocDGt1FugI1nuT/
	V3e5sgdM7uX+yzV+khn8Carsmp+yAwEs2EHgMjVx8PKlF4+TaPuAycCCsW5WRrwVerF5uoD8yjs
	YCvdmy/aSBRsq5F6zsqxEB8FhIyvAxhMw2Cnk4/xwQW1mXtOAHCeq3pmw37F4joe39Mcu8O9jgw
	cxOtB4HtZB2JCiNVpVPP/rddEUOWciKg1KVT0gya+l9fLwyfMLR
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr57975715637.26.1788974820346;
        Wed, 09 Sep 2026 10:27:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm52422943eec.7.2026.09.09.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:26:59 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:26:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/14] mfd: unused driver purge
Message-ID: <aqGWjAuGXq_JHvxk@google.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>

On Wed, Sep 09, 2026 at 03:21:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
> 
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
> 
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
> 
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.

Sounds good to me, especially if Lee makes an immutable branch from this
pull so we can all pull it in...

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
