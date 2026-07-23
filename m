Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABAA47886E;
	Thu, 23 Jul 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807532; cv=none; b=Td0T3N/zrNCaCS/r2Uu4NKjpScfMshjVzWOFY3I4TLZ1lSHIeDehycIzdTqotcRwO1ZQqVP0rs8wGrK84+9cKjVwm0metxw8bEa/MCU5+d8nQRjFMVo+zkWf5zZpc87v+cb2tAcry/xeKbTkzf3uavuckCAinQZg8+nrDt6bKKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807532; c=relaxed/simple;
	bh=5Aeda3tYL1GjuxDi01NBEakRq/GFPPUfPSYRwRUHEbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=re/UWDXWHuVdgxZmFFls+mHnkf2NaH1EZ3/x6BawklUHLyI0/ws91i92seHWQbCMOoyKQoIaNR1KDeH/IwImm6CR3aGpqcoCh2wft8eMzZ4F3w4aeRIs5/kVUyBT06bYZiaYRC9Xd5myw+GLomfakiAA12ZK0kEKxG4zuEm2m9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVUQqlH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVUQqlH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F9A1F000E9;
	Thu, 23 Jul 2026 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784807524;
	bh=9j2nLdyru6ubKUpJUXNHKFV5tgfei3+wpK7rs2jNFW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LVUQqlH7yyEEmRE6f51Rev8g0QN3h4pQJFMybORgpcdBjrTa5Bi+P+rS+PiIbJpWa
	 0XVBU7pSo1MHbXn8XePyga0kxrggxR8agpDg8yFad4Y1ugT+HODZzZr4ZNHaqtZPef
	 a0zRj6RmJi+m28y6XAcCTxzxhrqxxGwfutKofE4oVtPs6k4Jmm6l9eWtLmhgrZdUhR
	 qaxZO21fZIVp+L4/6U5q7mfF5Yn6/t55iDddch2lNJICA3qFm7BLTvb/1fGyiR2mYu
	 RtIhbmOPbmNdCVwiOdsSj2jO4iyh1xi9LjZn1u7Wd4DzH0eVsAkCoEJs/N76lrcVVY
	 9sl9zfpZ4efjA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
References: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
Subject: Re: (subset) [PATCH RESEND v3] dt-bindings: leds: Add
 default-intensity property
Message-Id: <178480752172.3382996.300395263332006645.b4-ty@b4>
Date: Thu, 23 Jul 2026 12:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 13 Jul 2026 10:50:28 +0200, Jonas Rebmann wrote:
> Document the default-intensity property to set a default color on
> multicolor LEDs.
> 
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: Add default-intensity property
      commit: 2ebd1cb772b00d1223895718155a03af4c56f396

--
Lee Jones [李琼斯]

