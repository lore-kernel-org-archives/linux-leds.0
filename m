Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E3325735
	for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2026 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770927556; cv=none; b=U2vGT0TBUewgyOrCmlGibzVt0DmR2wEEfw+KGFuhgcl3TdsFVtuXzX/wcWAkqQCr40G3SAPNTat5KgwF9r0OkiXL5s0aGad9uORd8wjTV8WlBxBZxZVbGv/Qh5U/ehUCXySYZz1vShZsePOCxzTnZGyfCFgOam6dXHrnjos//50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770927556; c=relaxed/simple;
	bh=xXnvM+8OykueY1NEjASwP8gahcI3U8JAAZxU1FiS6MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnN3UYkQivgu3vDfSYbk7vZUJD8gmlUdjWWeGNjKFZOyMv+RJTgUjS4P3109ge2n8W9N+OixRJ3GcT8UTdc8m8w20pqzthKf2YWD5Hhop70jm+5aoCeva+YGy1i97B1zq5/4eORhfzRkZi0sfFeuXNvtEvJT/IalHoTTeb1HHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhlP2e+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhlP2e+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC37AC19421
	for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2026 20:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770927555;
	bh=xXnvM+8OykueY1NEjASwP8gahcI3U8JAAZxU1FiS6MI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LhlP2e+oZ+w5QsAO6zkkuNcD0LvM0AXKtB7tkmbBgOuotpLsu/xgDJ4pIyy/s+14j
	 cAbjDDZJrEl9oSdwRZuXy9ziI6CqdsKJoGxjdQtve1vnlG/a2T/IbhyOojSX1rGzYX
	 hob6ZLrsk775Mo21it64PQqAnWwWo6KhGjWOGj5cccfUle8Djx6sfBG5oR+8h3KDsv
	 aa85N/pzZD2uitpFf2XlXlPw/7Msl1wI9Cg5kBgmUEnPNwb6I970goJjsDXGLsxBWl
	 l1f+W6R1vNa9COt3BMhDe0lPXkopmOO6f1YX9mCzcYyNciS6SNL0ZKBzL+DuLjfhID
	 ydUrZe1p78MRw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a35fc8007so293655a12.1
        for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2026 12:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqNN6hT9Lvmbcx6b7WifvhJ83MOfiZxBYC6hJPkHze7OhO/wmcK2YgkmHmTh4G3VtQsgIBtyX/DERZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrpOLi6klLOwfOp16I9fykRJzy4JKXCZpHcK6kJNOOPh6HiQKJ
	HfEjPtKt+OullMq8pWuFKwHQ7ttW/uyENF5NDDwWjoKPoH5XWQcZ+ySq1okcbVeISIohdcMhibc
	WPOgdJWxBCOS3V5aODTv3t00mAWdIyQ==
X-Received: by 2002:a17:907:1c1c:b0:b88:dc6:3967 with SMTP id
 a640c23a62f3a-b8facde807dmr15570966b.40.1770927554399; Thu, 12 Feb 2026
 12:19:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-9-clamor95@gmail.com>
 <20260211212016.GA3910589-robh@kernel.org> <E5BC797C-4362-4C75-BCAC-7C32A51C4725@gmail.com>
In-Reply-To: <E5BC797C-4362-4C75-BCAC-7C32A51C4725@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Feb 2026 14:19:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcFAP7oP0KzLp7DfcCpz0DjsjoAW3PcfnWu2nc-dG1CQ@mail.gmail.com>
X-Gm-Features: AZwV_QjR27lKcOZlGGh6bUTZWpEGD1ZyAvH4mw_Gs0vf4efEq1evZi3cDB-63Us
Message-ID: <CAL_JsqLcFAP7oP0KzLp7DfcCpz0DjsjoAW3PcfnWu2nc-dG1CQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: motorola-cpcap: convert to DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:30=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
>
>
> 11 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 23:20:16 GMT=
+02:00, Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >On Fri, Feb 06, 2026 at 07:28:42PM +0200, Svyatoslav Ryhel wrote:
> >> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAM=
L.
> >>
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>  .../bindings/mfd/motorola,cpcap.yaml          | 411 +++++++++++++++++=
+
> >>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
> >>  2 files changed, 411 insertions(+), 78 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpc=
ap.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpc=
ap.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml=
 b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> >> new file mode 100644
> >> index 000000000000..7e350721d9f6
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> >> @@ -0,0 +1,411 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Motorola CPCAP PMIC MFD
> >> +
> >> +maintainers:
> >> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - motorola,cpcap
> >> +      - st,6556002
> >
> >This does not match the only user in the kernel .dts files as
> >"st,6556002" should be a fallback.
> >
>
> Honestly, I would remove st,6556002 since it is not the only cpcap model =
which can be used, hence it cannot serve as a universal fallback. Some devi=
ces use ST produced cpcap chips, others use TI and range of models varies t=
oo. I guess I have to multiply commits.

The "cap" name goes way back to at least 2G Motorola phones. There
were whitecap and redcap chips for different 2G technologies which got
replaced by patriot (red+white+blue I guess) for 2.5G.

Dropping is fine with me, but then you have to update the .dtsi. If it
was me, I'd just make the binding match because that's 1 patch instead
of 2. You can still drop it on the new compatibles you are adding.

Rob
