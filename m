Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773046;
	b=xdPLp6dwZDmi02rjX/BCaxqw/mD/gGNsLZJGLhgIL8QJBnk8LEgh0kBo+m9XDL5Xc9ri
	 O+Gjy//TpNxv9Tu+9139oE+E+lAJQEEotqNwOtsHW0lYKBq/ATd04Mi5Rr8ehKzpQOhCs
	 J/uC2WUGOH0wcTzcIU2rdz2NRKOsmD6Etpqph35E1yZV0RWtQxRfX0Zi76J+y9N12lMN4
	 nMzpL6PjppP3mic95u/RO1dpjadL6dYxv784g81Grqg8wXbVfTNaSFTDI1tJg0F4PF4pU
	 Ctha/QCFN9vSh5d+630XnVlIbnwBM8XbKJlZyX9mWEZzjjFmO3Zvb/8OCv06TjgERBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773046;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=zNFDMSFIaCw75YXcbgilrN3XH7wdWh+K5avPyLE3VSo=;
	b=ab4lxvpOI0muysycDmllecXneAhWnXjUbdthxkYFR8vKcZI4c3aApUz1NxEvnBVumGG8
	 ZuRnAC/k1jqStgO1NSQ5QZ2yL67LqB2Z+OLGFtvbzimJWt/a0qnTO9uxa3UqLx9U1iHGc
	 SIPR3Xc+D2K6YPDW89hFtX7vfzmc/+iI+wvEGUkgpYolaq+fix49VNArtpNIpQ8Wtb9NO
	 4WUFlLW6uPxmUOecbJWQi5SquEe8tOWztT98lxVcI9Z36szgr5mNyvM6NIWFWp7Vaq0aW
	 WLb3/w4v5T5TagATWpvBDUOLBC9QhbcUJUfVt/lLxmLTxEukjGxHBH1cJWQ5fxnKpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMn2wKqf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC17606A324;
	Fri, 27 Nov 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMn2wKqf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291EB1F00897;
	Fri, 27 Nov 2026 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773046;
	bh=zNFDMSFIaCw75YXcbgilrN3XH7wdWh+K5avPyLE3VSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aMn2wKqfUQraCe6oksRmbRzRS8WNmqxUA7Y7kgeRZ6nGG9h257h3mFJhmOstasQk5
	 9jYEe+qjw0/b0Nvk6pR6hvCTC+xKQ9BoDNMvtXcDN0zRxQkyfxuwWZPd4CBPWuVW7e
	 rxXvbfO83hRXJfNmGpiGXwTq+l4LLPnark71sutocRCZnpo5AkcurW2dqv4jccHr10
	 2Tm7rlPj0/P+SH5fBFUMKL0ufJzzGKhIMXyGRIGYqzuAS1UiTRELj38/V68gKxyLBP
	 fc1PzEBfzLUY992HkxXe8LiUUvYWGUBV+p35T9KKPv69uwQurYTI+mho+y71qc62gj
	 oRr9HL+ORitrw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Flavio Amieiro <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
References: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
Subject: Re: [PATCH v6 0/2] leds: Add support for the is31fl3206 LED driver
Message-Id: <179577304392.49650.9635005979653207009.b4-ty@b4>
Date: Fri, 27 Nov 2026 09:50:43 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 20 Nov 2026 10:25:57 -0300, Flavio Amieiro wrote:
> This patch series adds support for the is31fl3206 LED driver to the
> already existing is31fl32xx driver.
> 
> The main difference between this specific variant and the others in
> the series is that the LED Control Register controls not only the
> enable status of the channel, but also the maximum output current for
> it.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx
      commit: d8574fec0e6f0c71626064f415239d3859f01021
[2/2] leds: is31f132xx: Add support for is31fl3206
      commit: 5d3bdf40e316f47e7e3f8220b97bbec658852a96

--
Lee Jones [李琼斯]

