Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04E3AA51A;
	Fri, 27 Mar 2026 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606804; cv=none; b=ulNf1A4ydoTNWRn+Ivr5N2q4JoSLdB+kt898EdeKcfuymcL7WrG43aIB+ZJORtIT2rVHs72STz02ErdDOSXg650D5rd+xYV8tH0gXnTtKpScuAm+xv7wb0PbuL9RiTQZuEg7LDWzXMV1sjPR8jPqi2/QPBztU8nsEbMN0LnSLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606804; c=relaxed/simple;
	bh=vIwmhW7GiLFB5zE29GmHbqoisru9dNovHZYfb00sEL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfzSz16GWqLSoMLynzCtV6/jMbPFOEl9m3aTHBEthQXJH2tpZBpKfbmVr3LM+Ma7ul/p7o5qe42sv5MYcqOi7bHxw/r2ZD9gyHQxK+Gi/BQl1MuWjKnS/KdF8nTjRuxevN3PcrtTuI2eXDo2mr8JcURocr3D1tc2g6lrStJQYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Rv8TV6f/; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Rv8TV6f/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1774606801; bh=vIwmhW7GiLFB5zE29GmHbqoisru9dNovHZYfb00sEL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv8TV6f/aVqGW9KVCj7jx9MMxyxww/lKvib6PI/MJD7IJWQFlWYM8UEB22r5Izupr
	 /fq6Om03C7nHsdgXA8iy9kmGsduTdlbAMiuBWUv47PfkjJze4R5yOa/4RsrOhMxJ6g
	 lp6JIrnSa+wQWODocwyNUY4rs2cmmMQN7IO9UBmhS70PBfRPvaHCDacBayksJpo1QH
	 tnM7bB+IgIaeDGXO/RfmxtYBplwsPg3Vb6mXPxv47begOlB1q1zbOaHnwk4gE+sxuL
	 ahsMCEwcJo7tn/sqC3B0Fn2uXF98sowFTT1ZXDI/f9fpXG4Kh0+uIxuPjnB6SPvHRr
	 rFJlvMCATqFIw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D091F1011B2; Fri, 27 Mar 2026 10:20:01 +0000 (GMT)
Date: Fri, 27 Mar 2026 10:20:01 +0000
From: Sean Young <sean@mess.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Message-ID: <acZZ0T1wzY0TCNTm@gofer.mess.org>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>

On Wed, Mar 25, 2026 at 06:07:28PM +0000, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> index f66ff5f7693..7d848117317 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> @@ -99,6 +99,10 @@ key-volume-up {
>  	};
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &pm6125_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio5";
> @@ -160,6 +164,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators-0 {
>  		compatible = "qcom,rpm-pm6125-regulators";
> @@ -332,6 +340,18 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;
> +	};
> +};
> +

Reviewed-by: Sean Young <sean@mess.org>

Thanks,

Sean

>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <30 4>;
>  };
> 
> -- 
> 2.53.0
