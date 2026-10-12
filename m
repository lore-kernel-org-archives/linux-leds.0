Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A03B2D10;
	Mon, 12 Oct 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798684; cv=none; b=rsvxGzjEe9qTIurgu92/kDwcbWH4QLDpMnRmiWRO4tvVe1KuIB2QyZkEwN1V5/nesuy24zf8MGDtYOTKZiiHpY/NtyyoKy5wuQW7PvwiYbWM41csXb1c+CKkaiI7mOGM10qr7IVoLYu7k7JipKBt6gFhKKNybWp7YGvcteQ0Bv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798684; c=relaxed/simple;
	bh=+enA7Hrof3Zy18XajVzrAimiFYtiNdzjUEV5fe7ZRTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgZ/uqg4Hp49iF5ts2opHIuvVqStcGtakEZqNGUKQGtyFY/kFzB/Iye1FjKXCUsr5V3Mdy7KLeQeFce2Xfu87D05ibq2tbuAq+yMtN25B61QUMR4em4rURZ24VuCfdX597oAUdpw7/0uO13ECvgCpa6yAIe/Ox4tn0uneRTNTK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0zWtTiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0zWtTiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2108F1F0089B;
	Mon, 12 Oct 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798682;
	bh=Q9JAcfiViG1ei9vMLDJn5LterOMjW/8A5DXAfZ+Ta2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0zWtTizirvWMjTo5Ej2SvNolC+hlfPaPkRQohNXlxT2JNCsWwQvOvx1qf09sCYrA
	 4uxcniomHJNOo88j4zPxCatm1uCe50ODynf6p17A1hVTQXrqZ+p9vlxHVZ5DLsUPa+
	 TVOcgjj0K8LmYnfjeozKsPLui1b6NSHQMunUYuXI6lt4tLGobsX04eufc3eoKldm3s
	 xDlBjkUwx+YrXWyF+vUt5CM2z5Vf0+sY9NcWNqKiNXOIBmGtc4RpGivuh8G9V2kAEV
	 nuKoqTSfdlvapK26mkjWTpg4HcFjubiR5C+bfNTadNvXy21dS2vqhis4uIWmiKf5Rt
	 x7N8goDM6VoIQ==
Date: Mon, 12 Oct 2026 11:51:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rillian Grant <rillian.grant@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: Document TI LM3643 dual LED
 flash driver
Message-ID: <20261012-micro-anteater-of-spirit-c068d0@quoll>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-2-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261011191026.149338-2-rillian.grant@gmail.com>

On Sun, Oct 11, 2026 at 08:09:43PM +0100, Rillian Grant wrote:
> Document Texas Instruments LM3643 dual LED flash driver devicetree
> bindings.
> 
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lm3643.yaml   | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

