Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8AF30329;
	Fri, 17 Nov 2023 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcSp1QDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E6DC433C8;
	Fri, 17 Nov 2023 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700225544;
	bh=kTLXCm1xShjyUDmWE4xeZjNHPRrRIIppOueUV0RDT2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcSp1QDdxC/MQvr9Ne5zh/HBYwMHao3rWw7w5iZ/62Osy6Yq6N3WmoLOGpl3pmZNH
	 ke/c7KKx4raoaT3Vf39v8PsqOAMc5y8vA1sNj/Fpe9tYUSPuWwS94/i02dj37+dK6E
	 +n9QP9deZBDRotRAQ+N7pB5QMjqV3LocVqBnf5290nlHxXSW2VHsgNIUEdOzJFJ8XI
	 eh04+VdZY6aytWKw8VrCWlXTUV6tkSJca9G8Ol3G0QxEhxAE7R5rmH7nQ/N5PGXOKg
	 Mu/H4xZHOM8Qkhq1tx5e8IGTEggnSV7zvOq3YnIEWBeFFaENHiSSi8kjRzpH7CmFNx
	 Z98hqHkgAs2wA==
Date: Fri, 17 Nov 2023 12:52:19 +0000
From: Lee Jones <lee@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH v2 0/2] leds: add more LED color and function definitions
Message-ID: <20231117125219.GB153049@google.com>
References: <TYAP286MB0315D3014B329FE6B5873F76BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYAP286MB0315D3014B329FE6B5873F76BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>

On Tue, 31 Oct 2023, Shiji Yang wrote:

> Hi!
> 
> This series patches add the missing LED color definitions and
> introduces two widely used LED functions "internet" and "rssi".
> 
> Regards,
> Shiji Yang
> 
> 
> Changes in v2:
> * Remove the LED name sorting patch as it changes the ABI
> 
> 
> Shiji Yang (2):
>   leds: core: add missing LED color strings
>   dt-bindings: leds: add "internet" and "rssi" function definitions

I don't see these patches attached to this cover letter.

Did you send them all threaded? 

-- 
Lee Jones [李琼斯]
