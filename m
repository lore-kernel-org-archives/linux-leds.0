Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439983;
	b=P0clN17SAzZwB/WawE3qW5NU8xXFLWayfyqvVDEQHBHyGYvZYYlU6E/vvhqCdT6cHbC0
	 01zh5Mmjw3E/Dm7D/Utm1SNVln4Iv/tTco6FBCzqrufhP5062njNclNh5QmK07O+VbaKj
	 Rk+YlOzu4xGiLl9/UJvO7NsbuKD3OuahPBtcAw24XRy3YZiZ7E0dRqHPTaDns3Fjtcubx
	 e7LYyz25tBcf8e9V6957NxBiOVkJv3tVI0k4dH9mWU9r+QamxbEnglg/Qcgw4nWA8EyyR
	 zhrXdG2e7MPAZdXB2rOKMNqVYNh2oEAk5OnBHMZ6CyQ84Dxi2mxWkGN+0YhtgFZ0k5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439983;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iYol7kGJlUO6lLn9bESn6OVQpRDCyh7pQI9vssz5C9A=;
	b=Cd7Qrr6Hq80VoCZLEUEuiyhCBiXrcxXiMQ8wOwBoF7ybL6H6VNnczYdwHBww0ZdqF3uE
	 b8Wh22lCJGtQyAcDGhwlL/y9FR2tqeG6TgkBs7VqrnOJR+ZyRJyM0KcgIN01v4BZjCt9M
	 UUAQ/IFPdcEW3X0ByHPpTgwSQqHE2vXw/UcjM6Z1v1/1F94mmz4+IK9+lc6jJSSxVr5Gf
	 5MFhfN9qKv9Sqbs8+RfOsswty5+JPm+xNoziev+ARc0Sx3pNw129FO+CjnxStf51tpUHG
	 T4OBmYrKEDopyt2a6xmRM8bwJQyByrPIcJxl2R3xD6UnQ+s/eiyUUapWK0htWo17YBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLaoyFtf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55614606A31A;
	Mon, 23 Nov 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLaoyFtf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084381F000C4;
	Mon, 23 Nov 2026 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439982;
	bh=iYol7kGJlUO6lLn9bESn6OVQpRDCyh7pQI9vssz5C9A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iLaoyFtfoyh/456qrViWqYmHM3K8JVMSIU7ppDp6t/1LPf1Dt++eLcVWM+4L9HSna
	 ApkEasYZJ9vx3wpAcYxzSuGPiDnI85omKzTtfXgG4zR40HTsNAca+eDNiW0VqNFWLV
	 0sd86e4eorF4r5QeNZfkBzcMOTRet0cTvIi3CCkMEMFAqLtcWCUC8O10VsRMAFtzpH
	 NcS0y5vrXw9m2Wy8WMvKNePeS9c+RHJr0RtVWiBBFQu+RB9mIYk81j+vPtO/kk2IAF
	 A57wdSSYSopLD2W/Zol/gwKuBS9ll7QbmQBdYUu35S/Dcs/wRihv0y4RYnMnhiEDbU
	 LTK6Gcp3RQiWw==
Subject:
 Re: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
From: netdev-bot+sashiko@kernel.org
To: a.shimko.dev@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org
Date: Mon, 23 Nov 2026 13:19:41 +0000
Message-ID: <179543998153.3135.2533998901272176773@kernel.org>
In-Reply-To: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new `leds` block in
  Documentation/devicetree/bindings/net/dptel,dap8211r.yaml mostly…

--

dt-bindings: net: dptel,dap8211r: add LED nodes

This commit documents an optional leds node in the DAP8211R PHY binding.
The PHY has three LED outputs, and each can be given a color, a function
and a default trigger. The commit also adds an example with two LED nodes.

> diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> index 4cd0f9730d954..772329feda059 100644
> --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml

[ ... ]

> @@ -45,10 +46,40 @@ properties:
>      maximum: 2250
>      default: 1950
>  
> +  leds:
> +    type: object
> +
> +    description:
> +      Optional node describing the three configurable LEDs of the PHY.
> +      Each LED can be assigned a color, function and default trigger
> +      (e.g. "netdev" for link/activity indication).
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^led@[0-2]$':
> +        type: object
> +
> +        $ref: /schemas/leds/common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              maximum: 2
> +
> +    additionalProperties: false
> +

[Severity: Low]
This isn't a bug, but does most of this block need to be here? The binding
already gets a leds definition from allOf: - $ref: ethernet-phy.yaml#:

Documentation/devicetree/bindings/net/ethernet-phy.yaml:
  leds:
    type: object

    properties:
      '#address-cells':
        const: 1

      '#size-cells':
        const: 0

    patternProperties:
      '^led@[a-f0-9]+$':
        $ref: /schemas/leds/common.yaml#
        ...
        required:
          - reg

        unevaluatedProperties: false

    additionalProperties: false

Most of the new block repeats ethernet-phy.yaml: the type: object keys, the
cell constraints, the common.yaml $ref and unevaluatedProperties: false.

Only two constraints are new. The '^led@[0-2]$' node name pattern, combined
with the local additionalProperties: false, rejects led@3 and above. The
reg items maximum of 2 limits the LED index.

Could the block be cut down to just the constraints that limit the PHY to
three LEDs?

The commit message also says:

  Document the optional "leds" node supported by the DAP8211R PHY.

Before this patch, a leds node with LED children already passed validation
for this PHY through ethernet-phy.yaml. Would it be clearer for the message
to say that the change limits the LED nodes to indices 0-2?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122131900.2951586-1-a.shimko.dev%40gmail.com
