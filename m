Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D882EBB86;
	Thu,  9 Oct 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022401; cv=none; b=JxLZ0cgeEEy/lBP6Ltxt+aLU3iXsMBkWRXkOM+2/kQQj4nwBSz5kAZEG7qZKxDFijaZPvEQFfMQWzXikmT6yNkzcDqXoI3QyQ39GrxZRWc/xdDdKKTiz/JD0O7IhqPon7QRLEfDhJ1r80RhuwybUPz1mNBu6rKNOkSKcNRYTUA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022401; c=relaxed/simple;
	bh=k9PhAgtbceOamRoBt5mp0hFLmHOU3vIBd3kfyAjCPDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WXG05hyTJf82gGLbV4JVxts6mOUzFsBDGsoX0uDhs830OO/vZ2VB+rzbY6+galAzGwRpeJduckj42pxrBbf/aHh6wZ15POmNp9rDZN/t3dxDUvfrhuxxK0hdSTeoq3vQtAsiEjQ5R1kFFBBR1wR2CgHJnmU1L44FCrgaguth2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUG+lsaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUG+lsaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A16DC4CEE7;
	Thu,  9 Oct 2025 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760022400;
	bh=k9PhAgtbceOamRoBt5mp0hFLmHOU3vIBd3kfyAjCPDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UUG+lsaSE8aWMZWAknJwavQevOQVHXzXwcL94mH/zXrp/FW57QpBjw0k4IJ7DVoDh
	 efLrF3wj0OTDdqsiyYI/AULOAHdWbXz9eKykdKiREhBTj+hWHs+vJcavlIz0qUZZHg
	 3Gctq6SB9nIBmUWqIJewDp4jTII8FcSbomltr+L91Akr2tCf1w6FVrNa7EzmFe1fkx
	 n1HMKTqNqjfSqbhRX0NBtmRCLjdsgFTZx4HRp2roMnQ2aeI6g17JbCGAdr6Ebz04ay
	 aIOfHXFt7BlDDNBPLNh8+NuouLDm0XOqvoHSZiJ1hl88rkr5AnzKaRkmzhER67Pf5I
	 xzfiN6XinLUIQ==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250926141913.25919-3-jefflessard3@gmail.com>
References: <20250926141913.25919-3-jefflessard3@gmail.com>
Subject: Re: (subset) [PATCH v5 2/7] dt-bindings: leds: add
 default-brightness property to common.yaml
Message-Id: <176002239897.2903943.16164674123781188723.b4-ty@kernel.org>
Date: Thu, 09 Oct 2025 16:06:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b87af

On Fri, 26 Sep 2025 10:19:03 -0400, Jean-François Lessard wrote:
> Add default-brightness property to leds/common.yaml to establish a single
> canonical definition for LED brightness initialization.
> 
> The property is currently defined locally in leds/leds-pwm.yaml and is
> needed by auxdisplay/titanmec,tm16xx.yaml. Properties should be defined
> in only one location to avoid type inconsistencies across bindings.
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: leds: add default-brightness property to common.yaml
      commit: bdbc4e3a018afcfbf29d50a5953df013bc98eb1c

--
Lee Jones [李琼斯]

