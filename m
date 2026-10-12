Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F2388885
	for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789939; cv=pass; b=UTobzvGiBS2vZdtY+FbPI+R4uSF4TSkrGYQK/xC4wIM3Iq/OA7D5C+B5BGPCJ11ReJkcg3e8y9v8XIzw9MoUYyIlsPJ/i7S9TeCYUiG/V7x98MiU6O+UhraI3+XxKNKo4zHG/oRzBMp+FiwAzUZx5QihsYKJGnByzGRj6dWwe0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789939; c=relaxed/simple;
	bh=bdf5ltVaII23b5cF27Fg81xlP8Z8tnf+GfwZrnYaosg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjQMa94dWtsA9rGHstU+R1Q5ayUjare9faWkxsGYyjxv5tsIqfKcPW8o3doRVJfDwhhDd66JfGIU6B91hW8SxdDKQlISKo5iy5lvrJYPVhaJWeOgMESGndfCN/jijE9177N6SbWSnvPsN82NExzzRP08+aV+Q+UVHYP+kqnUJRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJrPfd79; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJrPfd79"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3115c4451c8so1686688eec.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2026 00:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791789937; cv=none;
        d=google.com; s=arc-20260327;
        b=MAGMq2UbtffW95L2/IjSnQbkN/W7zA9Xq5jrrF29LRfkgaDf12gyvwflEFdJDHpCUk
         xuMQAsl3YETXTPbig2mhLqMIQY1RtOYORP1SX9d7sRbL9x18ALfeFzIQroK6E7s4mJd2
         IPX+Sy2r9P6GMBLnfQ9C02wFWPkVyNvCvWD0B5F1wlGG/fk/Q9p2cV+39ObeZrQ4MT9D
         N7NhO+xduLzmK3gs4zA0X9emenlZPES+9nCARGOtWTrv6nPNzkwDkInrEeO2RjbyhRVb
         nkitut0H0HNCMHXcjyJOstoG9VmgvYHy2UwIFcapMLbxUDeRx5yjxvNLeKqScceueP9K
         6YjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        fh=oXrUKbdMt+hE6XsmydN+Y0BzITsojIx7oIzY+Fqriz8=;
        b=LziE+aUCE1tsrPCncMm6M73XZ17QZ7S8SZ1itwxpxie2lfA0BiOHbuIWd1WgYbgKp9
         FRnt1B32Scn83LanhX/yUvCnlUr+i8YurP4p+mWN/Vlaaff6OfdE/EWTUc391xT5lYWQ
         pM0xgLZBaUl+dxr9norkfRQ0YIjB8CAkgdK8k6gX1azeynWqN92yj4pY9K0YrjHi94Ge
         VzokazWEcUofA0mjWzg52I9ViG1cpXxoxJHk78wzrWsDQ/ME2SmrYjPaI+dSvqejDC3S
         WULEEQf7D+jetCeQTdodLNbmyQc6gxH86EJmjUe6QYTFyZOqPgb2P9W7XtZQRFvXp8a0
         ww7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789937; x=1792394737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=HJrPfd79YiVZCU995r/rMn4cN6KQ/WHxEzu94leeDkodSEFd8Hgu4Zc+DL9FIENtv8
         telOCTzKdo9zjyYzjK9XSSaB+RgCkhYgNUwy3jM7RIOn2bJydCEkM0unBChBvTgrsoLj
         5NYpjki9scQXnk4CFHp+QySvcjMlmTGJiBgLqQjocCXx8XYeoo4sBKvV81Qkni0cT9GF
         XBlRtRWJU6tQMEN7AnB6zXItkh3cO7g/e1oJcMiUqZd8u+ln9dx1OG0pEHjqnrXruO1Q
         Qc+FfXHq1iW3DaXriQcFzNLmXLzmSc8kcAChPbDPkYZYJ9GY+VgsruSfC3OjZDSN89lI
         Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789937; x=1792394737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=VoF5KVi9AfFFZdWmBh0pzWOBvAJF5X/q6Zt9z1TRhKBnX/eR736Hzz3QWSP34IS3Dr
         hvPcfRdiLlFjB/TtfMODOa9MnWqfFeZx9EJjTtp1PbrcCBvw1Pi8v7Lu587aV0fS1tOF
         yTqv8NRNIp28WawOsZH9EjKtM6dmLP709grMhPPVdX/+8RmAiNNs07k/VeQFqnr+/qfk
         mMsmUoe6y0JozGx4+3cbnOOkq06wfOb0dNJ+JKD2hp6iZ9HCU0nXErL0MGywyZuKgCFX
         nPsjjgiX+GrEg3z+Meot5JpRCYmd4UexnVuI2SaJdtfQCqg7reMktD4y685wppzEmZ0+
         avwA==
X-Forwarded-Encrypted: i=1; AKwUvBw4k7K6304ZYKFwkTZhYJnpAE0FXoaiBzzobwMDUMV+Uy38iEGh16M1MiXM6V6KP51FFpNTREOcf9sN@vger.kernel.org
X-Gm-Message-State: AFq9FYIhpjKBpXKY7eZ1U1I+vHuLPmxN4G5jsNNjBoN6AWJ+tspFg6Qq
	9mlzlDRSWlwKpgnTJ6TUiXEsBtzIZ5A/0nMxJJhR6EEc4wq168eWIKGzocl0K1WBgHRegWvsHrs
	iqwZgvXacX99EuuYVSMWBZNhCvLC8ov0=
X-Gm-Gg: AYBFou0NWO2xgVzvFwUJtAKU41R9nbpdb2nqwiEoXmjZGVBEFhDubCHh1/3hc1AJHGw
	jqsLhBg5OjCfUx+JAjoxPU/S3ax/MSUWcbGnVzonxgWxn9qeb9inxcDL+2XwQKmC5T6D7d1//zZ
	cyqox5KdmAPOjv0BNUNi7K4KeoR9URurPlZdzUZKH8huIdMNTPNnVkF7WADS7BEuunBcEjh8Zwg
	UFuTMIzLAFZU0IStZlwV+YTr1zcjj8+0QEeGlI0Gscwg6UX4fqeYvCB1drR+x/j0YNMP7VghEFJ
	/h+3rrR/E1KmLIcSZjRkmw7W7Jmw4RLQJzbdMBFOoMA2nf7rgYb6GsA1fyQU33YMBSfG/46wMR/
	fNEAPHw5vrhlR1LPKfc4LYqs=
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id
 5a478bee46e88-3536c53930dmr14060639eec.13.1791789937444; Mon, 12 Oct 2026
 00:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
In-Reply-To: <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 10:25:25 +0300
X-Gm-Features: AclHuK-1jO_BaUkdoWPA5vu4sBjFNbD6AjUBsHVIwaLC2Wj8tW6qxhiDAHWP-Uc
Message-ID: <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:3=
5 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> >>
> >> Hi Svyatoslav,
> >>
> >> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> >>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory F=
lash
> >>> inhibition.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> ---
> >>>    Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +=
+++
> >>>    1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.=
yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> index a65d92522c9cf..596b5e284f44a 100644
> >>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> @@ -31,6 +31,10 @@ properties:
> >>>        maxItems: 1
> >>>        description: FL_EN pin
> >>>
> >>> +  flinh-gpios:
> >>> +    maxItems: 1
> >>> +    description: FLINH pin
> >>> +
> >>
> >> You don't seem to make use of it in your patch.
> >>
> >
> > I don't have to use it in my patch. This change completes and improves
> > hardware description of the AAT1290/1270.
>
> Still, If we don't have the use case I'd avoid adding it to not confuse
> people looking for its use in the driver.
>

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-20261009#n17

- DO attempt to make bindings complete even if a driver doesn't
support some features. For example, if a device has an interrupt, then
include the 'interrupts' property even if the driver is only polled
mode.

- DON'T refer to Linux or "device driver" in bindings. Bindings should
be based on what the hardware has, not what an OS and driver currently
support.

> --
> Best regards,
> Jacek Anaszewski
