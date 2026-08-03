Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68237882E;
	Mon,  3 Aug 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790469; cv=none; b=lr3D9Ode0PShX0cvLm8URab0OoSA2wzFv2RL2ZOfLKb8Er0SqVud4xWOmaEtOkIK03+t9NslzdCzHdWEyC9Oc85f0y1MKRALvRh5N6yQEqJmbyPNvM9y9slv/mz2va6yAGB/9V4UdMispSKxTIfPb/HITD+sQGgWuMXgxUUAPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790469; c=relaxed/simple;
	bh=RgbhY0UDacvlsqXCy4030ltocuDejJfIMH1W17S4pDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAAPbUKQmLARUc5+NYU3q5MM3sVEZ0Ws7eg4Qr+RBI690+xCgHau1sCDv/50/Lrgshn61wAMfvyR0jYYbiX77EemJ607qt0UTRz2qHzleYrGKXHtwQiKK+dhIwPoVUBYGw+Y6qruj5hFrBok81WdgJ2ZR5tSCZa499/KKmOkwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5+g8a3p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5+g8a3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937591F000E9;
	Mon,  3 Aug 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785790468;
	bh=cAICv9Y3OiRkODMPephn+FNJ7giL9q2NHL4/K0cdySo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b5+g8a3pgXZdcnVmp568x58Ne0p6KUyuwI+CO9HFchejoac9WP747WJLGny3v2ubQ
	 un/M+93X4m9qDZBekn+JWjr5qukpgI84qfzXEq/rGWz5NUtfW3cljAGw0Ynergdqzx
	 dGMcClv6OSGacnww5Z4uwLfRvADsNDQZtedrM/PgpJ8WLvgvDwsBggt/kkP1+7qdhY
	 W//sy9NVnMjUwpSmatMEKuQLOCH+ZYOqoYzN2nBR/6sAvyRjh8ysEkPZ4f/bG62G2q
	 /lEDodIwZC8whYvAg4Mc/OR2eheDDCD5PnYbHEsLGT/zLD5cWByIEh/34sSQMiZW5s
	 2FLYO+li4csaA==
Date: Mon, 3 Aug 2026 15:54:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, krzk@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	lee@kernel.org, manuelebner@mailbox.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	danielt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: fix typos and brackets
Message-ID: <178579016893.432136.13741968373464663974.robh@kernel.org>
References: <20260722101246.3113818-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722101246.3113818-2-manuelebnerli@mailbox.org>


On Wed, 22 Jul 2026 12:12:47 +0200, Manuel Ebner wrote:
> Add missing '(', ')', '}'
> Remove needless '(', ')', '{', '}'
> 'lover voltage' -> 'lower voltage'
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
>  rebased
> 
> [v1]
>  https://lore.kernel.org/all/20260713134751.498891-2-manuelebner@mailbox.org/
> 
> I changed to my new address, manuelebner +LI @mailbox.org to
> reduce the mail to my main address.
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml           | 2 +-
>  .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml          | 2 +-
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
>  .../devicetree/bindings/memory-controllers/renesas,dbsc.yaml  | 2 +-
>  .../devicetree/bindings/memory-controllers/ti-aemif.txt       | 4 ++--
>  Documentation/devicetree/bindings/mips/brcm/soc.txt           | 2 +-
>  Documentation/devicetree/bindings/phy/phy-miphy365x.txt       | 2 +-
>  Documentation/devicetree/bindings/powerpc/ibm,vas.txt         | 2 +-
>  Documentation/devicetree/bindings/regulator/max8907.txt       | 1 -
>  .../bindings/regulator/mediatek,mt6358-regulator.yaml         | 2 +-
>  .../devicetree/bindings/regulator/pbias-regulator.txt         | 1 +
>  .../devicetree/bindings/regulator/rohm,bd71837-regulator.yaml | 4 ++--
>  .../devicetree/bindings/regulator/rohm,bd71847-regulator.yaml | 4 ++--
>  .../devicetree/bindings/sound/mikroe,mikroe-proto.txt         | 1 -
>  Documentation/devicetree/bindings/usb/iproc-udc.txt           | 1 +
>  15 files changed, 17 insertions(+), 17 deletions(-)
> 

I applied, but dropped the .txt changes. The only fixes for .txt 
bindings are converting them to schema.

Thanks,
Rob
