Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E3388371
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371031; cv=none; b=GWwXi+XOg8NB/9sytmTKLdUrgUU6JKCDhCP7k0Rbmj/iULnSNo+GYaMHMd1BsHVhER07JMoXvn3CSrBlF/stlK1KGI8IEzKk5HsMNRtrHkKPmJailYPfdPG6E1zwDN4y9vPuFAQVr16UjT9R4uuFVBwJ3cfUvoFN6sUtZbR6iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371031; c=relaxed/simple;
	bh=N7qnGOpfN5hThlyA7NYa4vIgBnwE21RqwNhqj1H8pQM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h3yS6fjdEed3ZmLVPG0B6GpQy8WneIj6MmqUqQHFxYCuBhQfmVY4eNWA7S1HTgNhaaGHJd81mZCVbREoyBrr7V0G0yBpXAB0MPYeU16aGrwkSSO8JsktzbqruB50z87K7kbMSI8uMbxTgZa3bVCXza6futvfPQ+dEAO2Ab0JCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCVjPh5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCVjPh5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CFA1F0089C;
	Wed,  7 Oct 2026 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371005;
	bh=zpbwSgBi2iom5EeMBQ5f/beTYaPRT05jV9ZfnGlrZTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CCVjPh5ksSEIwBhBee9wsR2zJOYarF2yDdQ4/i0n9+oIWL4/OLDa3SrOkMUR5BBU4
	 VuHrAinpguC+jBELZVS4GbLJWlim8UZWsoxYJbfDdia0zNzqKIWnzb8Thy/nKNROuO
	 qPNBGl5GPwYvJiJrIkCU3nAeSbI8P8C+TINVttOnOAU/AYqz4yV8ZiuClvL5Ylq5ph
	 58X6a7QPFD7+j/aZal31wf4MMMj+t+gXtix11nLOoo14WDVgb/8XVW43mWx4NNHRMc
	 HXsjzCtbsLVL7H0WZCOhEpJjI8wC4R6eWv3rMoe/4Q0ibXZOQ+RF14dkmoYjmA/2Wf
	 oGjxerMpYeAuQ==
Message-ID: <sashiko-outbox-162904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lm3532: propagate enable GPIO errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261007104915.507801-1-phucduc.bui@gmail.com>
References: <20261007104915.507801-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:03:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: lm3532: unconditional dev_err() in caller defeats dev_err_=
probe() log suppression
- [Low] leds: lm3532: commit message description capitalization violation
--

commit 8b48de70c8c717d07cec849b9e0b416a17a8bb23
Author: bui duc phuc <phucduc.bui@gmail.com>

leds: lm3532: propagate enable GPIO errors

This commit modifies the lm3532 driver to check the return value of
devm_gpiod_get_optional() and propagate errors, rather than treating them
as if the GPIO were not present.

> leds: lm3532: propagate enable GPIO errors

[Severity: Low]
This isn't a bug, but does the commit message subject violate the LED
subsystem guidelines? The guidelines require the commit message description
following the subsystem prefix to be capitalized. Should the description
start with a capital letter?

> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index b51496910b082..a3bc9680dc4cf 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  	priv->enable_gpio =3D devm_gpiod_get_optional(&priv->client->dev,
>  						   "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(priv->enable_gpio))
> -		priv->enable_gpio =3D NULL;
> +		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
> +				     "failed to get enable GPIO\n");

[Severity: Medium]
Will this change result in unconditional error logging during deferred prob=
es
anyway?

When devm_gpiod_get_optional() returns a deferred probe error, dev_err_prob=
e()
correctly suppresses the log message here. However, the caller lm3532_probe=
()
does not use dev_err_probe() for its return check:

lm3532_probe() {
    ...
    ret =3D lm3532_parse_node(drvdata);
    if (ret) {
        dev_err(&client->dev, "Failed to parse node\n");
        return ret;
    }
    ...
}

Because the deferred probe error now bubbles up to lm3532_probe(), won't the
caller log a hard error message to the kernel log and negate the suppression
benefit of this patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007104915.5078=
01-1-phucduc.bui@gmail.com?part=3D1
