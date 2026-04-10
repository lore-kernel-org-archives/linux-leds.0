Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE02345749;
	Fri, 10 Apr 2026 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857207; cv=none; b=AsaN+L5zkca1lFbjTy9XZGXJKJSh/eeaeMhHM8AjCHyS0aOMg+014ajUQpN6e6nOrZzP6AMtv0u4d2ESJFPFKK65FBEPu/koFesgHhcuthqUg4wT+frqIxtOIRZgxADfbwFcRiZFZKHdGPD14q089QHM71BrUG/i7aOjlNcY9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857207; c=relaxed/simple;
	bh=GeuUMRs2W9Fh+4XlcGggZYngTDUj3oGxt427uSOKYoo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XzrK5wAhUbXgWF0TVpJNKfwV3tDdEyZb3RJ5ogHrSkO/cAKFYb7ptWakARelD9Nb2iwxr+3hU90mgW+J0mN7ue3F7tciBlKabyvbFK990Gw3JgK+v3Yd8BT17sNFZSWzAOnlyx4RLgWPlXhmYyt9vbKZotAK+5J0IPrglaRBo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68cef.dsl.pool.telekom.hu [::ffff:81.182.140.239])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AC.0000000069D96CFE.000BCF15; Fri, 10 Apr 2026 23:34:54 +0200
Message-ID: <4e954ef3b906ffe102fe2709bd62844581478043.camel@irl.hu>
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
From: Gergo Koteles <soyer@irl.hu>
To: Corvin =?ISO-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>,
  linux-kernel@vger.kernel.org
Cc: "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
  Pavel Machek <pavel@kernel.org>,
  "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
         BINDINGS" <devicetree@vger.kernel.org>,
  Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,
  Corvin =?ISO-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
  Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>,
  INAGAKI Hiroshi <musashino.open@gmail.com>,
  Jacek Anaszewski <jacek.anaszewski@gmail.com>,
  Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
  =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
  Roderick Colenbrander <roderick@gaikai.com>,
  Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 23:35:00 +0200
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-04-08 at 08:29 +0200, Corvin K=C3=B6hne wrote:
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>=20
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
>=20
> All contributors to leds/common.h file in copy.
>=20
> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
> ---
>  include/dt-bindings/leds/common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 4f017bea0123..b7bafbaf7df3 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>  /*
>   * This header provides macros for the common LEDs device tree bindings.
>   *

I don't know if a single line change counts, but it's fine with me.

Acked-by: Gergo Koteles <soyer@irl.hu>
