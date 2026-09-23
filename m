Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B633CEBB9;
	Wed, 23 Sep 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149127; cv=none; b=GZDSyQRaYnVRmQxaC8dhYhh74+Ut/FhEOWOdWKY0/Lrjsfu5Rj7r92CsxhQd9x1Fd7gaTIdn7ybHakK4s4XsE5i5thEhxgF0wxrT8JoyEQvMA+/d93PA4aQ7JCvqCYCT3Yu2VMNcQ9sr6BuQrZMuPml1FDaQeUdhqelj3/y3FVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149127; c=relaxed/simple;
	bh=aeKEa21Iv1JnzMhWoiWrgkB+/HCmOxnb1+KOKo5zeQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c5mh1v5fAWJvnuCSMtQLBeszUvem43PN1EuVzQ8vRfYI/ByRx6h6Clz3FUIb6C3eum9AVFIjorJ5UATwZk0NX+59DjWJU3pVkMDoLghN7m2GQdbWoWgVdn0Q4ax/jKxXuVBW/HLEdn1dlD3NGJaRp5BT7Vs2TJ0bFcaVCV+5Cdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXt3JE3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXt3JE3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EE41F000FF;
	Wed, 23 Sep 2026 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790149125;
	bh=Ca6KHXxuLELUG7BYqtOwJNcmxYZr9gn5Koogd1BC89Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YXt3JE3UFgMfkGrc1uXTosYF/bgezhTxImF1EiWn6QN1JAOUHb2ZgAH+9ki4mR6Fi
	 NcpWzpjCMby0w7WOBnPnHPkUTMp2c81RE6UblDtty/eFM7Yp2rYdofYP5QX7sn7033
	 Fk4kA4psFI5iFlkhTIWVbkYjCJHazQRI4QAsBjFwg/D4S2nMgcEIPWsUF2ihtyaBbF
	 AXdmGhL7nFwhmeSYSSuCGnpz6WgHRW7JO5B+COGm2pta8GjQt8hymaX79zvBb4LLjY
	 F7UWWFrP65kbZ7eafSYmazN/4SMv6cpaXRY8N6RCKr3qTH6BX4H62wjS+pO1ib3qY6
	 i1R6koveO+iRA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
References: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
Subject: Re: [PATCH v13 0/2] Add support for LTC3208 multi-display driver
Message-Id: <179014912339.3812484.345851253549300659.b4-ty@b4>
Date: Wed, 23 Sep 2026 08:38:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 11 Sep 2026 08:01:50 +0800, Jan Carlo Roleda wrote:
> The LTC3208 is a multi-display LED driver, using a high-efficiency, low
> noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
> AUX). Current for each LED is controlled by the I2C serial interface.
> Four AUX current sources can be independently assigned via the I2C port
> to the CAM, SUB, MAIN, or AUX DAC controlled displays
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      commit: 6db5536b3bb71ab303fe7e9b95d77a09702c24a3
[2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver
      commit: 83858f2b93922e1a6ddb77ed76b18711950f8b0d

--
Lee Jones [李琼斯]

