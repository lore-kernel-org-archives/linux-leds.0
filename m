Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566D04D0A0B;
	Tue, 15 Sep 2026 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503909; cv=none; b=J560kSfCusVXvGmV0vYoeqiJrEw7itSkJZ/CeCCVZ+pImXGUlIZ6x0Y6fa8Vf9rpec3dYnh5Sv+4tO05O0uGJhtGvswZfrLzXZe1R7PPSlE7VZyyUodjw+zXYZLBS9zy3vr6qpnbLgBW4MmuawywtHJiYmXPGgSck+FH9V5xRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503909; c=relaxed/simple;
	bh=/uQmxJnEI7GMumFCTvLm0x+THBTd2JpBgQwzYCqrYOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxPC68b8oLMiueFRtHFsVUSDkP88vDuwabqtgsg5Z12q7pZmscrN/So4FP1dSv90uj/UjHkFscDXIOpB8zOq5a1hbSIPDQWsmphXf95uUClKN7oGJczJYm6sN2aqwvg9qptxJWurAGrDeBCQOYGsSjqFavbhozg3+ejGMpyVnt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJi/G0nr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJi/G0nr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340BB1F00893;
	Tue, 15 Sep 2026 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789503905;
	bh=EoD/r3KYpGurHEFTIS1d5XO7/LlPn8OpaAzlaaTsy0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LJi/G0nrm6CQ8uO1vWKA73eKCCXoKoBULSw6YbVIutEY3841RE0fv+quuFlYBhmIE
	 PkVqN+rkd9MINHjKPc2TBkC6/EG/SyuRmeYuOvqG1dD2iIRFuWrWkCYKn7DWVLzUvg
	 jGym4VicVwuE2StjU84x+lN11DDfINSH6Q9Qv4fIDg+PI8KP1iRBqVDwmAp3bm4nTR
	 y6wSGwL3WomEOWnHkras5bC4cigcsIPIDiWFdGro82n6s5H3DrybS5Hu1GVRNCsGn/
	 rO5jwwb/SeXbqh+PNhw/Ge2EugJShSMud+gZYva+vi5FqgImz+HvWXT1sbE5c6H9lH
	 OLuNVlRBbLYgg==
Date: Tue, 15 Sep 2026 15:25:03 -0500
From: Rob Herring <robh@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	lee@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Message-ID: <20260915202503.GA3364430-robh@kernel.org>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
 <20260913024510.485A11F000FF@smtp.kernel.org>
 <583fd625-b57f-44be-96c8-94d981c29c79@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <583fd625-b57f-44be-96c8-94d981c29c79@gmail.com>

On Tue, Sep 15, 2026 at 12:49:47PM -0700, Rudraksha Gupta wrote:
> 
> On 9/12/26 19:45, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The `oneOf` constraint incorrectly makes `ent-gpios` and `vin-supply` mutually exclusive and strictly requires exactly one to be present, contradicting the claim that `vin-supply` is optional and artificially restricting valid hardware configurations.
> > --
> make ARCH=arm CHECK_DTBS=y DT_SCHEMA_FILES=richtek,rt8515.yaml \
>       qcom/qcom-msm8960-samsung-expressatt.dtb \
>       st/ste-ux500-samsung-codina.dtb \
>       st/ste-ux500-samsung-codina-tmo.dtb \
>       st/ste-ux500-samsung-gavini.dtb \
>       st/ste-ux500-samsung-golden.dtb \
>       st/ste-ux500-samsung-janice.dtb \
>       st/ste-ux500-samsung-kyle.dtb \
>       st/ste-ux500-samsung-skomer.dtb
> 
> all 8 in-tree users of this binding. 0 warnings.
> 
> existing hw passes. 

So?

> Probably not useful to account for hw not in the tree

Oh, yes it is.


> > commit 72463777ee1c18e7913b350d5d2ad857810ece89
> > Author: Rudraksha Gupta <guptarud@gmail.com>
> > Subject: dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
> > 
> > This commit adds support for single-channel variants of the RT8515 flash
> > ICs. It makes ent-gpios optional and introduces a vin-supply property,
> > adding a oneOf constraint to manage their presence.
> > 
> > > diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> > > index 0356371a6b014..ab3c5139132cc 100644
> > > --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> > [ ... ]
> > 
> > > @@ -81,10 +90,15 @@ properties:
> > >   required:
> > >     - compatible
> > > -  - ent-gpios
> > >     - enf-gpios
> > >     - led
> > > +oneOf:
> > > +  - required:
> > > +      - ent-gpios
> > > +  - required:
> > > +      - vin-supply
> > > +
> > [Severity: Medium]
> > Does this oneOf constraint incorrectly restrict valid hardware configurations?
> > 
> > The oneOf constraint strictly requires exactly one of its subschemas to match.
> > If a single-channel IC (which naturally lacks ent-gpios) does not use the
> > explicitly optional vin-supply regulator, zero subschemas will match, causing
> > schema validation to fail.
> > 
> > Conversely, if a standard dual-channel IC (which requires ent-gpios) is also
> > powered by a vin-supply regulator, two subschemas will match. This will also
> > fail validation due to the strict exclusivity of oneOf.

I agree. It makes little sense that you can only have either a supply or 
a GPIO. If that does make sense, the commit message better explain why.

Rob
