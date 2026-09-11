Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3F340D90
	for <linux-leds@vger.kernel.org>; Fri, 11 Sep 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137004; cv=pass; b=Maut2kb2I1UnZ2YJEkzx+nWflT4brYGk/CwRsXhi4yiqT3CzVuUeYFforbu3VZKgOkWwm8Mcr42EkYTwLZpecXgTCKWxsRcqMAEM59HTEsCosbJpl6tRleMEXJBBQ7PwUTbnBkozsMDMvg+kDjP05UGOKHZJLNrrH2M7cv95Efg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137004; c=relaxed/simple;
	bh=RaPpBgN+D6zuIGLXpWCho2L5MGJqgyWZi2TZOyFTZio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpCeGuIrXgFdbdYONTQifymv7j9buZAea8WxIGURTuMd3UqD/+ivT0m19Iu467qM/Pj3L2GnCizFfCeNO5geiRbkSRHBjSaHWXbFraEwmGCOqADyUlVO/u688qqmhxdayaZXcs9H2SwNsGswQim0fzRm1TgstUtLnp4StNg+VtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSGCXqA+; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSGCXqA+"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fc2844f0eso878058d50.1
        for <linux-leds@vger.kernel.org>; Fri, 11 Sep 2026 07:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137002; cv=none;
        d=google.com; s=arc-20260327;
        b=eoMPeQXDTZsgaEM1JC4Njo/EHUpOD2NcHO7AeMRDzBi0EgFOo9ZHUurZUbr/kmgrh3
         5UnltiAymI3FizSN/pb9lrWqRLOO8mSSj+eH5GY23b/sCkFHRPbknRs7kDvI2rdaUfVB
         49bt+/W3b/5+gALW+3yZSdOQeqELj7VAhXBE2cokWkEHTs1pru8oqH9/jXiG42QmnlGa
         FlMkRdv1WTtvT11L4ehIuSleT0g/bk5UOVJn0a8vld5ryCCBz764OrTRta4jnFXkWYna
         vWYQxjI71OoHRt+YY9b2NjEV4iFNV6LvFXNdOvjSGv+1d1sTuYTVCZopYZnQbqvMEoBd
         Ntvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        fh=efSdUXrHNtQUK6PaZlF0E2qKVYKF9gpYomjlj40uGsw=;
        b=kfsUwjJhm+RgP6V/5pcNMsou2QXcvKDP/Q+/QnHxE5vSF3HAjDxH/b4S9pcxgw5Scc
         3eskDJXU8arfzg3szoE7+L08eojmFLizjvcSOCUSrBDUFhqiDtflr9d1Dwo8SjkigtRx
         WrMza9m1RLRA6V27wycGHDJA0yPjs7Iv7H/7iNf2xEbdRbkOWDRy96fvc4nVZvLE0iBK
         tMQObyypteG0spg4TjqZ7OWD5CxXskyypZJkMNQ8WzR9CU/75NiOs50arqK154fz+kuz
         HASaGbTHtcVd8MOT/uPdLtFJ8HE0deGO8NNt272ufLUwrdqPlewJQxHWVw3H2Aw7F58w
         cIHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137002; x=1789741802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=PSGCXqA+LTembs6869Z6+lxEJE5qWTfM9LaWWMcnqcCEHU/L0Q9/Q1EScyhQETNJHn
         CgeLXwJFAqkW5S8l+CIznafqzuFnxQ6cXq/C0i9QGaTfYx8P4gYJ7tGujajZ+lsz9i8j
         Bi86sWqvVsCbgT5A9DuEM1Y+/cKa7+Wmd722aLUMsdITy9Fx+Uovrg0eUhIWh4Z0sgDH
         D8+yfkr10OgPotItzTY8OIMxWNDbALQ/Aqe7tTw1ZLOy+XRY0lS3+AFKTgnr/Kf5XwOa
         LcMzZLFsAnS/T/89yFd9s1mFATipv4UNXegcYE6kJxerR65S+hqg7N2SEfwXhqotbDGb
         sVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137002; x=1789741802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=XMr3wde7rLAr/3/zJUxrTsTskmr7h+uxbv1nylGDocag7hdQAkZN6eHaByd4+j9E06
         DydAkQBag/UOq3olQ7arH5i5xDRYBZVjc+TJnW5chFHXuk/lenraWIY5BQ+Nt3k8szlZ
         R/6WdXTqGOVn324D8QfM7mIe9aptpxO7ij1/fu/igeNOmQjqkRqy+hk/+jN8KOogNT6Z
         nCivj4AlZoyx93pWBzSL9IAmlvL3GIaxXhLWcYjihi2XEH/XxqreGNWfwGfsPv/ryisM
         r9iY5qVm+bxV9mQkwnfzMMGdv2IreI2Mh4XMd1atYvARfRTO63dvL7jfhNCfk22xez+e
         tang==
X-Forwarded-Encrypted: i=1; AKwUvBysPyMB6rai+wJy1RT1HvJk086bZE7HgYgHQvOw7xeRD0tkGfYm84qG4/uSu2BTBbHxnGi7YyNSBFiT@vger.kernel.org
X-Gm-Message-State: AFuF++k62Av6sQxFs0C4rsH0Sdwm3H/+BO8VFJdTwFN4Wa9n+vWLH/xC
	mJpglz+fEkFgCs1/HocZzQVm3NNf7JbwjRb6kUhDQcuhskNGtVDSlEFkhnF5ZfopRT/yZg+RIMi
	Vzx0oqPtq8mx8nqZK1qZWtEa7I3bcoyCCNzOiyQU=
X-Gm-Gg: AYBFou2ZE96astVCh8U0pW42pCzB+DvDW65ezl0t2LOD0DMmBzEi2Ia03p659MMv+R2
	cvI4DKw+0DLhW7SPtyaG+ADnZAz21YTU+DBNI3hDGWSKYtcyHapKe3/9FVj7LL8UYeagzcwpn8V
	6p2JEOKntK3v+Z9UEg2hNV/xzmddtmaK3IKoOPwUfz5Ckd45lWTvnEBgvUyNaYFOXfTtxVqNkdH
	BnOtGuLCiDpd1+l/f9ShQG98js2mxqxUJkv5C8koXLj+r+GM9FspdqvewOGxWpBpGbd7zKFEKQE
	JPDGA4l5KfDaC7Hu/obDzH0fcpp6GaJemEXPgdlOxP12S7iQKyocEI/r1hGZUlU0/zw=
X-Received: by 2002:a05:690e:d48:b0:66e:57d3:766f with SMTP id
 956f58d0204a3-6712457ec2amr1411116d50.5.1789137002131; Fri, 11 Sep 2026
 07:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com> <20260909-arcane-yellow-beluga-5ce6f7@quoll>
In-Reply-To: <20260909-arcane-yellow-beluga-5ce6f7@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Fri, 11 Sep 2026 19:59:49 +0530
X-Gm-Features: AcwNN1XJ7ErReuk8FrPMLVElmntuOvsTP3mJQkZbaLhh_fmWSTDFDh93bPAgHIo
Message-ID: <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +properties:
> > +  compatible:
> > +    const: lacie,netxbig-leds
> > +
> > +  gpio-ext:
> > +    description: Phandle for the gpio-ext bus.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  timers:
> > +    description: |
> > +      Timer array. Each timer entry is represented by three integers:
> > +      Mode (gpio-ext bus), delay_on and delay_off.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +patternProperties:
> > +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
>
> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
>
> Actually entire pattern is very odd - it has $ in the middle, but then
> followed with other REQUIRED stuff. I am surprised it works, but
> regardless it is absolutely not readable. Looks like a begative pattern,
> but why would you have negative pattern for known properties?

Thanks for the review Krzysztof.

The negative lookahead was added because patternProperties matches all top-
level property names that fit the pattern, so excluded known top-level
properties like gpio-ext and pinctrl-*;

In patch v1, I've used additionalProperties which removes the regex entirely
and allows arbitrary child-node names. But removed and used patternProperties
as per the review feedback.

Could you please suggest to me which way to proceed? with additionalProperties
or patternProperties

>
>
>
>
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      label: true
> > +      linux,default-trigger: true
>
> Drop both, common.yaml provides these.

Taken care in the next revision.

>
> > +
> > +      mode-addr:
> > +        description: Mode register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      mode-val:
> > +        description: |
>
> Do not need '|' unless you need to preserve formatting.

Taken care in the next revision.

>
> > +          Mode to value mapping. Each entry is represented by two integers:
> > +          a mode and the corresponding value on the gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +      bright-addr:
> > +        description: Brightness register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      max-brightness:
> > +        description: Maximum brightness value.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    required:
> > +      - mode-addr
> > +      - mode-val
> > +      - bright-addr
> > +      - max-brightness
> > +
> > +required:
> > +  - compatible
> > +  - gpio-ext
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/leds-netxbig.h>
> > +
> > +    netxbig-leds {
>
> Just "leds"

Taken care in the next revision.

>
> > +        compatible = "lacie,netxbig-leds";
>

Regards,
Udaya Kiran Challa
