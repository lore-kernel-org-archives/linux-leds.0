Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619868;
	b=gcCvwAx38BbYC/HiNvB4Ujm69i6jxREmNWZbxDKpE8dphn9+Et6RIjaRIjdoOPSkGjnD
	 OufWoPJUHFqPXrQAxf04pLFcrQPH/LSVqPGITt8weoZglN0GqPPRx9aCSnvsBz0PxBFKk
	 hxhrcwUYD8pIgL4rYPztY0rtehJueU+DfPRPP9SxiVfz/ccG74PjgIoJE7bL70EaozeL4
	 OKx7sV+NJp/aSuaXDlkUNQVle5nPNmtS+xKuCVKLkZLbAswenRq8eFUMFtsloR6WvQpXo
	 z9hg47fj5ZerMUrpvncB/03glRQJ1c75h30ah7uNU85cKrZcYXLWGBZWSbo3uHTZg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619868;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DwNOUDx3s8aWtTDxni4gD4AvCFiiolZW9PK8Ed9xdqo=;
	b=ZYPwGdEfRL4iEl45O3aEUibn7OJLiKlMt3ShD3ddat4kkRTR6hZ1aVZ3Ax7JYfs/LO7T
	 WjUyPfkoVJPWLbUu54SvLZJ/xpS14werMCeNhfbPo7qgHOUlUXKtJmP6WtJzi7VOr9ApC
	 8NMHrZADltwWDAy8JUpJCZBcjojdKymr4ApEKmHBQYceMtpd23GwMKj/p+rIKlp2uOEP1
	 RwooC5xkBC3s/fZYd+opGVlIzf3UbFGNgadWava9NHm/48tsqmrUXY/R8F57yr8leTX+i
	 jKZuXfyQ30y9+FAvSu2IRm2WwTuk1cz45aVuRQEnCaDrsqp996T5ML09XDS44M7hDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SeuMbo/c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B28606A324;
	Mon,  2 Nov 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeuMbo/c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A51F00A16;
	Mon,  2 Nov 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619867;
	bh=DwNOUDx3s8aWtTDxni4gD4AvCFiiolZW9PK8Ed9xdqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SeuMbo/cKza6FqQXc0v+eouBmO5lhLXVpA9ZMEUvoOtIXZnIo0XmMXnX16eD0fpLb
	 +HazxW5slkl/F+LywE79ZY1Yv1xc3fLNL6cN1Lvdc7AFhXBUNaC3BjmEGby34L+jwx
	 Cp8jKTSYeB2Ey1yeEdZCPVdXCn/XhwwfNK9uQwQgbQ0k/VxbqTy3Gnl3qzA+6dQfhM
	 71D/4d72QvKfgg8CjpjgChaBt/M6TzWsQvcWB06gbkt5Uz9FJGqAu5WJtVZa2cPvAH
	 T7qJNig1KW39sAp+N169vKELBIhHgJ30xHRwqDh2gAhfVXe7VC84AZ5FKDyAOIRvJ4
	 S1C7ZVt2tS8rw==
Date: Mon, 2 Nov 2026 12:44:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
Message-ID: <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev>

On Sun, Nov 01, 2026 at 09:12:29PM -0500, Joseph Telaak wrote:
> The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
> address and the current steps of the KTD2026. It only differs in the
> flash period, which is (Reg1 + 1) * 128 ms instead of 256 ms + Reg1 *
> 128 ms, so a KTD2026 driver runs it with blink periods that are 128 ms
> off. Document it with the KTD2026 as fallback.
> 
> The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).
> 
> Assisted-by: Claude:claude-opus-5-5

Drop.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../devicetree/bindings/leds/kinetic,ktd202x.yaml         | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

