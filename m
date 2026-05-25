Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0C26E6F3;
	Mon, 25 May 2026 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740436; cv=none; b=MMTC2MWCz0/u+PZNAO75W6RgAZ1Yux0EnPpzgo6SZPY38KySoAjdZVcFUK2WgpVepLNAldnY/bGyGq16xMsZMC8KKJfTdPUFfVrc2dOk6m/gpCG0vfmhIqMD9Iq8dgJ0jgMDUoQsGhLs2JNO1ViVfVH5l1Y8Z0Zcfa7jon3ZYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740436; c=relaxed/simple;
	bh=YZ1yyqhl3w57lFN9tZhNep+gczLlMmoYi3YVsLEhg/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C1arHSdS2bl/qwMbNEhtb2oKTaehDbMz4puKXkSZFyhyAimCQkz5CXSej+Fm2VLdpwtvgxiST0C0qxfQ8qWkniYUPazoEDkG2zN4Jdaxn8QJcTwuL5wyuJa8g2HftLFguetAqiSa87/Cl78P3LhuB/+MVf+8+eigPckp9712+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GDCxrW8r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GDCxrW8r"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1C1F340E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740435; bh=iEqbfXEo5zV9+7JtMjZrdCNiVM2NI1tL2TnfmBDyYDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GDCxrW8rNuZvUbQPow7AskOSYzbqBm1au4LnzPZXpEQErNS10aFVPqzAWhLpmG892
	 CBQXz8UG0VUMxq8ougWOzzR74tqXVByTzDJR18N1pTk27fUheWq/+8iEBSrGgezW9B
	 Q812Md2IiqJ7PJREQwO9ep1WxPLd7Yspjq53CQb0YraAnHy6/PAv0lktxEGvXne0I0
	 9XIT/vd67NOM1xK192g9/dwJrq1HTI8H4tcA0pUmEYUqXws5xtnTZe93Pm4TTYNhPr
	 D7VZ+2p5qcDIsPqkpQXx4Qm4NyJr9oT/doqa4H1eK3+gL124I6HqGJu0ndsM/0IGNv
	 A9X9jMQgSCvWg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1C1F340E37;
	Mon, 25 May 2026 20:20:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakurai Shun <ssh1326@icloud.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typo in leds-lp55xx.rst
In-Reply-To: <20260517043303.17111-1-ssh1326@icloud.com>
References: <20260517043303.17111-1-ssh1326@icloud.com>
Date: Mon, 25 May 2026 14:20:34 -0600
Message-ID: <874ijv1bsd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sakurai Shun <ssh1326@icloud.com> writes:

> Replace "regsister" with "register"
>
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
> ---
>  Documentation/leds/leds-lp55xx.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/leds/leds-lp55xx.rst b/Documentation/leds/leds-lp55xx.rst
> index 632e41cec..f60c7ec39 100644
> --- a/Documentation/leds/leds-lp55xx.rst
> +++ b/Documentation/leds/leds-lp55xx.rst
> @@ -18,7 +18,7 @@ The LP55xx common driver provides these features using exported functions.
>  
>    lp55xx_init_device() / lp55xx_deinit_device()
>    lp55xx_register_leds() / lp55xx_unregister_leds()
> -  lp55xx_regsister_sysfs() / lp55xx_unregister_sysfs()
> +  lp55xx_register_sysfs() / lp55xx_unregister_sysfs()

Applied, thanks.

jon
