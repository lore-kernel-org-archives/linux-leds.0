Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF42395266
	for <linux-leds@vger.kernel.org>; Mon, 24 Aug 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564002; cv=none; b=X3rUB4SxGYJQkjWwBFfu9Fl9bStwQge3qK6bFrqDXtfXp8pB9w7nmGJUieCmeABdJ+xH4n80XFL7epBK3v4LcXX+JgOOq5gpopihZ0xD2IzGd6iCWeJAmTa99kMx1ityMAvAarAZK5J0toN2emNIfTZTEJpNxINiYUSIFeBRJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564002; c=relaxed/simple;
	bh=FqqX1Mln5GUPxDhrH5Nc5ECsMnro9xqpY8P5ZgebS4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk0bZzSmXUmElpDRW1n3TcJ/UPgHZbXCXHUTtD5LwtMusBrqjjVZqYuII6JTH7SUhWgy0LXKiVxJRgSCDyY3sKVi/v8LJU0n3wTNIb1m+S5ZH1O23/moNhBtpbaeW7CmCsQ8EctEFEbOxq1niA7kjB4pG+xHNb8Yrd1B529/Sso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=oIjcEQlA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="oIjcEQlA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so21331505e9.2
        for <linux-leds@vger.kernel.org>; Mon, 24 Aug 2026 02:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787563999; x=1788168799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqqX1Mln5GUPxDhrH5Nc5ECsMnro9xqpY8P5ZgebS4M=;
        b=oIjcEQlANUv01vd7M3tJtWhbdqdmSJc9fCXyGzSJLjKXf5RLbXZLOqhCI2/nsqMUBP
         e97x+WGPa4DGR13z2uh9q2f9lurVF+xPxeoSJmapnB89UcdR0BB5DLxkWWjDhh3ziLcS
         mHXlSvlC144FSsBWPnLuf64D7kVYXfTHOrczn2t0hnn44L6U0PUVL6Vlizg49/O005Gb
         lpoMPvUprYuHQU/zC1Y4rVSL+wg7JGklwFccJyl3BP8dHwtLpHv30aT1p7t+bS1h1Acr
         ayW3BR3+ONS1pQVLC/reP7Z1c+tS6lDFjdI+dEUnocXeUTHNCm2BAhOnCfCGZMFCUvO+
         J0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563999; x=1788168799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqqX1Mln5GUPxDhrH5Nc5ECsMnro9xqpY8P5ZgebS4M=;
        b=YXXB10pCQRlhd0yvSxXRVRVYaWfo0lhPih7cxhVJq9/kZrvyvcrvV+ALqgiSaG2D7V
         2MMCxXQr6t6mJgGsNFWig2RSwQgCTilrTq3d//z6HWX/2h5g/2Pwc3kwpEO3IvZ/1gO1
         g9YErm68Hm0FjZBAYmVQ1RGNmy4CGidPKWG4YN1IYLjy3MSxsoZCm7TYNpamwBrkFfUw
         MuBmVcAi105DE4fGnzxcX0tY3VESOjCvrO0t1Y+KD4rqIW0QPnVbXQ7GmI5OlAvaPqnI
         uFbTRe4xdbXa6n6zghPMI8HAk5CYvhsFUfP5pY0ffhiYNuDTs0QpzXE4zG3D7xyKiQHX
         JMAg==
X-Forwarded-Encrypted: i=1; AHgh+RpwMywEOoDvQ7ErKhnlGL1MQlwmmE5rMtXhBhgVvZBRW6G9kYiKuzLa9R7oE+YDnJTHT6zv8d6mW9sB@vger.kernel.org
X-Gm-Message-State: AFuF++nSa+kgEiykCSHoApNAjqzmVGN+QUHa/JOpLjqk0k+0p+tuLC6l
	S+dErPrGoxpXm2BnUsY/8XugxGCfJeot2vLPSasCCML05Hs613SC4Ae4vpfZc302Jo0=
X-Gm-Gg: AR+sD11WvlgiFxVFLBrGZZkZ24Fzk9S2qPGoGQ15IfGzRd/X5eqK5FR2o8zHPE0sDQ6
	xHEnWBw43ptUvGEX+8fEvAH1do7i+1Nl835wD0I6F4HnEjDUuc4Um/3D0nKjeEq200izoozd4pn
	/sisRY2CyXcHlgOm2QcmVUKvUfuj2YHJSa5jtWuR1/7ci9UunSeN7Uv7Xnw4NuMWPK+E2MFpQ9E
	q3gcEfFEzWFeYenx7Jdt/7UgObdQwTPRCW1mOqKHE0bU/LfisM39b7Xrz4XwNtu/sL5YxCdySdJ
	+AeH72eUjKJvWgQyfAb1Ulqh2PK8BSLoOqW7a8ZZEVv/gJCtscon1cyrGo2udYKf1K8m05fBP18
	m2n7w313W0Kdh+gXObQnue6QkSHkthFizcOmbP/ejY68OabEvOydz6YW2uUQin+TNjM30Nvm4cR
	7Rm+cq/bJEL+74ldLtjW0OzdpckKEpyRS6Q3AFpMpcsO+thYH6OzNp773frjYZ0CPmOWWyiioDX
	RgNWvmyWps6naqTK2p7zsOaPjMtFYh0vI0HfQy/AcovE9M6zSb5vZnCg3I4qEICQFnpY1/XyLUp
	05WB8YQQQAV8N5mTwNWM6k2F4t/tIL4Rqge1tGEKoEGA6g==
X-Received: by 2002:a05:600c:19cc:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-499b847725emr306902295e9.15.1787563999161;
        Mon, 24 Aug 2026 02:33:19 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bebfa94esm70641885e9.1.2026.08.24.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:33:18 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:33:16 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lp8864: Register a backlight device
Message-ID: <aowP3K7sgXKnsonS@aspen.lan>
References: <20260817170817.1933046-1-alexander.sverdlin@siemens.com>
 <20260817170817.1933046-3-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817170817.1933046-3-alexander.sverdlin@siemens.com>

On Mon, Aug 17, 2026 at 07:08:15PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> The LP8864/LP8866 is a display-cluster LED backlight driver. Expose a
> standard backlight class interface in addition to the LED class device,
> so it can be used by display/panel stacks that expect a backlight.
>
> Use the new devm_led_backlight_register() helper, which spawns a
> led-backlight device driven by our LED and tied to the I2C device
> lifetime. This keeps the driver a plain LED driver, requires no
> device-tree changes and remains backwards compatible with existing DTs.
> It is a no-op when the led-backlight support is not enabled.

... but when led-backlight support is enabled it will prohibit the use
of the LED sysfs interface.

Having zero DT changes is a nice property but it seems rather fragile to
change the ABI the userspace must use to manipulate the LED based on
CONFIG_LED_BL.

Is there no way to explictly configure which ABI should be used?


Daniel.
