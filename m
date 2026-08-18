Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF947F76E;
	Tue, 18 Aug 2026 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072236; cv=none; b=Hb3kbVxkNz0L36WZlDE1OMELHWoOFyLHlySS0CqgqgOSVH/yDM80mbvaAUq0YZCTjW6STDg37FTWoNb4rUS1WNyztTVoSCobEnzCXVm5TpgSCy5I8lcW/jRNIBThUVpGckCnL4dUe0EFuWIMReB67jynB9T7Cb8txHaUupqjqEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072236; c=relaxed/simple;
	bh=tCA+IrOgl0TI0ASn4UW/HUYcwjwtOaKJEMUXJNs+gRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyKMCwCTgwkRTYlPzw6OaNdEYcOiWrlIhJxwWEeoo24YncLimgZeA49Q7Sg6TeJLfSeWfN3GPJm+EPEENRy8ACzwoZv3d/W0t6wvb5qp5zJ+QTIVbnUc18ljaZwl8+xx1U4+tTVuGs7QMNEFqL9auS4R5JCC7ePVjsGTI55QiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBqu//zs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBqu//zs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30651F000E9;
	Tue, 18 Aug 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072233;
	bh=v2D91J1cQscmpB+R6hsDS6baUe0r+dwI9DEe+zgXKa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oBqu//zsvb2bwqV0EHsgoz6jrhGPJBxeXTv3Xdmp5zsXseBKD+tYoOJdvlGh3vSS4
	 kkex1uX3Nt/Zgp74SbQLDjodt6fl+VY1QA4LFdoJkZNr25LDE5XNku4QPWhovfHecs
	 MVmhCL+uoiC/vZmJKZs5rCJckBPkNTP6XIEpAgBe9yPuiGlt1Xzsmonwk8m9VBTokt
	 3nm3X3wZFmO6GDn09WJCEpT2D5JrqG89hhNl0wabWXa0oxqNKtggdaglqj/VFx+W60
	 m9YfYeL0oDwWrdGmVdWRTWGabWg/BsTvkUNyJmQsyy5P8f7PdfpkCR21gPTXxrdbMJ
	 5E+NN52khT4hw==
From: Jakub Kicinski <kuba@kernel.org>
To: ahmadexp@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	peda@lysator.liu.se,
	trannamatk@gmail.com,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: leds: Add IS32FL3207 controller
Date: Tue, 18 Aug 2026 09:57:10 -0700
Message-ID: <20260818165710.4008324-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
References: <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: leds: Add IS32FL3207 controller

This adds a binding for the Lumissil IS32FL3207 18-channel constant-current
LED controller, describing I2C addressing, VCC supply, the SDB enable GPIO,
the RISET resistor and per-output current limits.  Outputs may be described
either as individual led@N nodes or grouped into multicolor nodes, where the
group node name may use either a unit address or a dash suffix.

> diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> new file mode 100644
> index 0000000000000..2e53aa1e202dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> @@ -0,0 +1,281 @@

[ ... ]

> +  "^multi-led(@[0-9a-f]|-[0-9]+)?$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 15
> +        description: |
> +          Optional zero-based lowest-numbered output used by a group named
> +          multi-led@N. Values 0 through 15 correspond to OUT1 through OUT16.
> +          For a multi-led-N group without reg, the driver derives the lowest
> +          output from its component nodes. This form permits groups beginning
> +          at channels 16 or 17 while following the common multicolor node-name
> +          schema.

[Severity: Low]

The single pattern here matches multi-led, multi-led@<hex> and
multi-led-<dec>, and reg is declared unconditionally optional and
unconditionally allowed for all three forms.

Since there is no allOf/if-then keyed on $nodename, can the schema still
distinguish the two node-name forms?  Two shapes appear to validate that the
description says should not exist:

    multi-led@5 {           /* unit address, but no reg */
        #address-cells = <1>;
        #size-cells = <0>;
        led@0 { ... };
    };

    multi-led-1 {           /* no unit address, but has reg */
        reg = <5>;
        #address-cells = <1>;
        #size-cells = <0>;
        led@10 { ... };
    };

dtc's unit_address_vs_reg check rejects both ("node has a unit name, but no
reg or ranges property" and "node has a reg or ranges property, but no unit
name"), but that check is off for normal dtb builds:

scripts/Makefile.dtbs:
    # Disable noisy checks by default
    ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
    DTC_FLAGS += -Wno-unit_address_vs_reg \
    ...

so for a board dts built without W=1 the schema is the only thing left to
catch it.

For the first shape there is also nothing that ties the unit address to the
channels actually used, because is32fl3207_register_multicolor() only compares
reg against the derived first channel when reg is present:

    if (has_group_reg && group_reg != first_channel)
        return dev_err_probe(...);

Would a node named multi-led@5 that in fact drives channels 0..2 be silently
accepted, making the unit address meaningless?

Would something like this express the intent instead:

    allOf:
      - if:
          properties:
            $nodename:
              pattern: '^multi-led@'
        then:
          required:
            - reg
        else:
          properties:
            reg: false

or alternatively splitting the two node-name forms into separate
patternProperties entries?

[ ... ]
-- 
pw-bot: cr
