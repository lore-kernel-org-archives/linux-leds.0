Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A536AB61
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066376; cv=none; b=bKbonZh2xi2jZI8Afuhq84MgPungPWVWszkJHxAFYTxWFCYjWLrRKcal1Zk6gmTPdY/w4y3/ixg8XWn2tYxQb3Spw0+COX8hf2f+73gZ8rcTx2LlFl8vEXVpBufVqxepBz28b1IPkaIMrkX2vSbwGiCknRNFuMSteQ6irOlMdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066376; c=relaxed/simple;
	bh=TnnyjYX5HvBdVYkia6z5YJNJ8yUsxQUM2yQDZk5t8iY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obKcMz4SM7CstqyTxqwFAuoeT34m9qILoggPoVati0m+srMHlBiG0LIOTiIYISyFkJ8eyjcrxDfleRNQBcm8Vq4vPGYcu8m/HNC8Zg2M5Aggrd23i91h/EKXcI+CHSxSEvmdCCK4KafhkQ/mU1edSww19DUaF6mw0F/JRBFvZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAAnqDrg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAAnqDrg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462C61F00ACF
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066375;
	bh=TnnyjYX5HvBdVYkia6z5YJNJ8yUsxQUM2yQDZk5t8iY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FAAnqDrgjamPmTgjE60IUptFCrEf1OUyE57VF+v5WERbMpHF+Y9LhXtixdep4N8Fg
	 2q+AnG9AJq5r4JFHdOP79Iy1FXLUSDG+PkPv6sJ/bMKSkTS2R1I7eLV9sbEOiKhoXM
	 ASu1AGGdP0L4+WP9Kc/hpiUQOlg5tWe1UaXswhlHHVozUSUdtQn7wdS0zEGS7hBloq
	 DSJ7N75hapEGbPUxvQMKqr372j2ZVH3526TAC4RzjxX+g+gL1/6OqSEWH72xpS+Kyy
	 CRCwT6bgLDUXHblXVtB0lOXUvyLk1ESakxezlhepRwFYsHzNqzE+Pq6GK6SG2EaAdX
	 sOQeI57eN8LBw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b27812c96so2659451fa.0
        for <linux-leds@vger.kernel.org>; Fri, 03 Jul 2026 01:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIq1OfaFBqoWaEjf4ETLeJuI8a+2xlJKtVcXbFfkK9n9Ghq+I1jKCtkeBNi1VIGDkBmgM1dsEHiS5d@vger.kernel.org
X-Gm-Message-State: AOJu0YynZ9X4+tIuXnYoP9/1Z3T2e0WcWUE1dv4Y3lAoJ1O2QVJ5oKFz
	VMtrAV+XLY4+raLQ4ATnjbKeHKOXIdkuGrXn+ZGYTJykLXiwY3KTI69keP/aa43+Mek2aJ+AWXg
	Lq9aI/bSSA9lOS9rgci0naKyX1CYX/dDlibDlsyDvuQ==
X-Received: by 2002:a05:651c:895:b0:39a:cfea:f16 with SMTP id
 38308e7fff4ca-39b340ec041mr20745751fa.31.1783066373977; Fri, 03 Jul 2026
 01:12:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:12:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:12:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703014201.69829-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703014201.69829-1-chou.cosmo@gmail.com>
Date: Fri, 3 Jul 2026 03:12:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc_P+hTKS78f-z58NLxxQryTYBUB5iSz-8byZ-b-KpCdA@mail.gmail.com>
X-Gm-Features: AVVi8CcUHxfGyOx3nWd8Ky11RaD_tXOn6-VDMeVUXGZjoZu45WxHMCeQ4CWgMT0
Message-ID: <CAMRc=Mc_P+hTKS78f-z58NLxxQryTYBUB5iSz-8byZ-b-KpCdA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, riku.voipio@iki.fi, linusw@kernel.org, 
	brgl@kernel.org, linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 03:42:01 +0200, Cosmo Chou <chou.cosmo@gmail.com> said:
> The pca9532_gpio_set_value() function incorrectly mapped the requested
> value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
> A requested logical high (val=1) incorrectly enabled the LED output
> driver, which on this open-drain device pulls the pin low, while a
> requested logical low (val=0) released the pin.
>
> Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
> high-impedance) and val=0 yields PCA9532_ON (pin driven low).
>
> pca9532_gpio_direction_input() is also updated to pass val=1 to
> pca9532_gpio_set_value() to align with the corrected polarity mapping,
> ensuring the pin remains not driven when configured as an input.
>
> Fixes: 3c1ab50d0a31 ("drivers/leds/leds-pca9532.c: add gpio capability")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
