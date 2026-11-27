Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769792;
	b=nHbl8uxyQAO8+B7ntVhlLWC15i1/4driu/uI+Dwi0eH5JPYT1o+qGaslU+soFA9TGI60
	 DfTeDcJz3eMKZmPYibNS4luvqc9ULZCi3KBL9GpccSBPcNfQdi+rpNaIc6E97WfyRKG9c
	 tFj3w7TiLl1NfoSINBvxUadKnGIxL/YRHFTNUjsJ4nQOxXT4nfAxKtQCGdsF3ah+/v52N
	 LyA98rHd5HhmiGVpI9RXbk56whZrlpjFwVOXwnGjGB4dyJI3uyuOMWIwxnSwqBfpQcUZk
	 EQ3F6Y7+lfH8sDkC0UYRbTBwrNfbWWZ4DVZG0m20peFpQY9uh69xdGIePuvO1Fy7jwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9rNTpH9Li+0NQ9qsL251ixBLWG9WqPm4Bt4FfyrwwQU=;
	b=UHG/zwZFhSk1KTJa2PUlVwBovkmT0UjAV5Sz9LlBb+2B1WN3ySTqjIxyonSG24gasUfJ
	 BG/lIlGIvK2XF8dVlBAPhJEA4AlYINydomJCyt3kijHqieHxymTP4PBkdUPQV92txFAPD
	 F2mEhSPPYhRZdQfIzmKzSgLzojC06VCyssQJyZDZDI++VsD9oPNMBDNKGvyFvJPHfwSAH
	 5oh/kQXlttfY/gNuSctpjMoU4zQWOS76IxDAYq+hzY4Oh9lArOId3EryyYPHJf1cLOgCx
	 Y6x/UbxttHKkTCEulnK74cUVf/u6fhknhILdXLsmlim7YhbP1RU9xC6Uw/hV9sRZTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhNFEvsC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E07606A326;
	Fri, 27 Nov 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhNFEvsC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53331F00893;
	Fri, 27 Nov 2026 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769792;
	bh=9rNTpH9Li+0NQ9qsL251ixBLWG9WqPm4Bt4FfyrwwQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhNFEvsCAlGD4pFuROObs9+ojsbjNIdr+VklnJtC0tJZuB5fbk+n5PtAYgHrhHska
	 +gr2Nr2cktAihE89c1e+GB5wrw2BeL33+pgHJ1/l9lI5XA/1QYY/bLaV+LpDVLmBs+
	 fu1laWPWsDYFVgOHRcL7EAJhFF/EX1B4ekdSksVEsVKVZxBP6AH7fdEememglJq1jm
	 kQln5JMV/Ud21cvnCbp5jIVHPX4ovEzeyTWfDeD3PDemuwha0Sr7hW0Zj1uc/Jeosa
	 3g8Dne5pG7ikT/cTfoWW08OQBoLfxTNf3wRSTSpjBxH0nzDkKHUQzT/AiEJRNaMLFO
	 MW0v4umnENhNg==
Message-ID: <sashiko-outbox-236928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
 <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:56:31 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: qcom-lpg: redundant and unsorted qcom,pm7550-pwm entry in
  lpg_of_table
--

commit 6c2a39f2e9b5bda877898f0d505a3b83ecc1cbd3
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

leds: qcom-lpg: Add PM7550 PWM compatible

This commit adds the "qcom,pm7550-pwm" compatible string to lpg_of_table[]
using pm8350c_pwm_data.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 98e39e03b9a15..6c9cbc75bbfb3 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] =3D=
 {
>  	{ .compatible =3D "qcom,pm660l-lpg", .data =3D &pm660l_lpg_data },
>  	{ .compatible =3D "qcom,pm8150b-lpg", .data =3D &pm8150b_lpg_data },
>  	{ .compatible =3D "qcom,pm8150l-lpg", .data =3D &pm8150l_lpg_data },
> +	{ .compatible =3D "qcom,pm7550-pwm", .data =3D &pm8350c_pwm_data },
>  	{ .compatible =3D "qcom,pm8350c-pwm", .data =3D &pm8350c_pwm_data },
>  	{ .compatible =3D "qcom,pm8916-pwm", .data =3D &pm8916_pwm_data },
>  	{ .compatible =3D "qcom,pm8941-lpg", .data =3D &pm8941_lpg_data },

[Severity: Low]
Is this entry in lpg_of_table[] needed when the binding already requires
"qcom,pm8350c-pwm" as a fallback compatible?

Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml {
    ...
      - items:
          - enum:
              - qcom,pm7550-pwm
              - qcom,pm8550-pwm
              - qcom,pmh0101-pwm
          - const: qcom,pm8350c-pwm
    ...
}

Matching on the "qcom,pm8350c-pwm" fallback already binds the device to
pm8350c_pwm_data, which is why the other fallback-paired compatibles in
the binding (such as "qcom,pm8550-pwm" and "qcom,pmh0101-pwm") are not
listed in lpg_of_table[].  Also, if this entry is kept, "qcom,pm7550-pwm"
is out of alphabetical order after "qcom,pm8150l-lpg".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_disp=
_all-v1-0-a18be7f65fd4@oss.qualcomm.com?part=3D4
