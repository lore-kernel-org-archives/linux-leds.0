Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40E3CF051
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140696; cv=pass; b=acPVPC/NBEdiuXKB6m22lSMYsjs2q8J4csBrFrGqZbsoAFuX5KUd/u4EEQU41OfFqay5mSq9tDt2/T4PG3hvSE5+a+fNUAnWb3xWXLURj/RNBRlbBD/bcJRerUq/K78U0CF+G7Hcgr+vuzQOxxDiztc4gzSIzpFoaHNAV/Js3Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140696; c=relaxed/simple;
	bh=/szjitr1JF6qSuEGCBNiddM0d5D1/45sj0Iytm86R1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMJ+WX0DV1BfAiBcDNlFbTVxfribJ2pI3Qt8/4+exMUwfnMkYVuEtYfsjJp43DFH5aWCSlWwPnT6plzQSDzRSoUSc9LWJ+oojasUfxFCUQYPogZezr1vNnfGxEF3jz2dLfovmBY1GF1NMKyVbRi5H5COLHqVWiWXvNponM8HHPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jg7+i7/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgaS3dWz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jg7+i7/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgaS3dWz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7S3012904581
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 08:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=; b=jg7+i7/h0/1+dgac
	c/IH+KszMopK6T6ODzBRdn24ovwm/K4QF1gEljMdO6hM4KYTPMnXHyfeTqLFDjKl
	QWVluy8uIU7EAw4+P4X19lWCCs7CsnLWR0avItF165eaNdCgNEsr/YyQTcyfcu4i
	i5nx8h+/oDLiuHJLgUS3fmOFwDOnlYEX+eGAQrDWcltU/G7pAZcuyuz5TlL4D0cn
	4pIGXAwRjWuU90hS1eRHxo0xOLO1uxLyQknnFZPTBhVldV5nS+fEIpVMvwQ6P3gj
	9EHDQ1JGetmKXecvGJ3PlRfshCWxQoXnNg1UoBT4xDaJOPPQ+0v/Lz9f1xRXx/8J
	x4x3vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7w85k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 08:24:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso261458385a.3
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 01:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140683; cv=none;
        d=google.com; s=arc-20260327;
        b=Ap7i4CkR1iw/LP1+Z8t2HM00zcp6QWKfkoxNbaM2eufMaR8t1BcJiMwysjNuJwLW4o
         ZWN27WQcpmCgkH89+aYUx7PCnko9e+R1VEkdDugr02INW00rJoHqIsmhge3Z9qBg/VZ7
         hSjmqHVV0CtA7Jc/AQiwaM/rad2RMILQ9476vI4Fbv7HE5Go0NNq2jjXZIr+morqQRs9
         HdFUN0bTMhYMIT9zOQmXMnWqzjtIEoo3LRXnQzbiFHnNv4HABT4BaeHP2rvMOkav/tds
         T/CjBXmgQnjlFpvSiWzbcWIAKpwE7c3ZdQM/yG9CwYw6g4DXKt1RZ3Hsdwx4J94w/fh7
         aDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        fh=TyiaB59r2kWxdsbeAMms/xvy9kGJQm917y44eRD4pG4=;
        b=SCGGKfnLiieF+Z1A+GhuonHoqgdSFgmP436M0EHW7RolFbpOV4LX/gfukX5TqhCREk
         iocyMdUQUwjy5uEj1/aSyVP/X7b3BZ+Y+DGXOWTBXM9EOslN8cTM7e7inWY4t+llgfqS
         5jf2HaglvsMGFq/a0019CA0aVoCXiDdPvtmLUHqkhi9dVnve/n7ftW/Kxfa19V5Hs3et
         LL8e9F1t2bPNhwHNxiOPDnPMr/vnKmAkjvFSHG8v5+1wpudeCx/VQoA6rf5MeY6uQsoT
         sS1XujcUbhkbdHSGo+Y2byaWsY8pPmjxuc7fE1HBmxoxKYjTrHrcg60tBcdUKjZJsY4G
         t8Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785140683; x=1785745483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=cgaS3dWzVHyD/gFSNLKEmyJLDmMG8DnyhC6Ttwpw+MIffZM01B012/MxwHdqx+J0M5
         tnFPD157f/a18sKsSmtJJHR2tJn08DYALz1ixSCtOJnzQNEPthaOZcx+W8SxVE7EQH2X
         wAEf14IqNdI3Q8xX/VIxOtYyMsW/whvOtbA6j8VxyIQgJ8V+ZKY3g5Y+jkToOt/vax1S
         mBQyU6GOsw5u7tL9ORH9wC9ULj5Zi8nEwN8KQfEQ6TWJ/hvp1obUIUZEH+3Zn4NzFaUr
         /z5G6CRtMYwRsZ5rps5LuOcGS72ZAkLfaypQWY1z5ymI6JLDfOQsZaTytAB4/9PSXY3m
         0UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140683; x=1785745483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=oypxLU+kmaR4wevcq8tUzA0vlC0PK+UJUkH85nBLZDQ20Gt+votXRLZ0Zh4oM4MEBN
         68YtDDFkuGZ42uynLVomSItwFXdmowaM5EWc9hmbOQ0tUhnQ8hFQsc//xa70i4AnvbDR
         Nezag7nZdBfNhorh1Zgaf0vuLi8vLIulzi1vlvem4fnHQUobw5/vKtiJ6bNdpIFF+sk0
         Pg/+uss1liX9o2+0wbSkIjAt9BH0MxLsi7FFs2WKMnHSQWAdsf4d/Z1MFW9S7C7BsrAO
         qLYD9CNbnY7xf/SOqH5/MG1l/GDzts7m3C1dfzk/kj8SOfy3TqZ7oxttwh7t19zzq81s
         3brg==
X-Forwarded-Encrypted: i=1; AHgh+RqGNwX5yqDMDotb6IurZrzvq4+R7uXeM0ZaDz7nkAIfgguckooJAQU7u/8mhYOtOM25kw2QYhebwrn3@vger.kernel.org
X-Gm-Message-State: AOJu0YzDv0L0ZFC7OtvUNGU5LTYjK/r24Fr3ZZ8gt145XSlzp8nMY6bB
	nxogqhi1/SH4sQxJ3DLerqSFfezlwTu/n/L8/JI/6lK+dldTDWWnbPdTqbsQIcnuyamRVwLAkC9
	KM/H9ysGI7om4ZzIT9mX3rYmnnRgk/qpMkKCVITnvQi8STFcKllTWmBqfDx6YK6bNf0IDVRxugY
	Bbevk7vvIXgEn2wfYr+qtSCdv7Njck0YPWkmDv2kY=
X-Gm-Gg: AR+sD11K1zwPN0ZdhSzmlDNnvFB9ser9gSVUZ08B48CqBLFgV1BXeDzpLR3pHhgwVFB
	O+HPvttt97ombunrXLOzYc26frOQZ+CBBiF2pztps/FZeou08FrWWaHdWTZ9CDduEVc8lC0eZI8
	9rlKi5bQYx9/0Z8I1wG3TdJSljzs49bYB2u/87HVlXH+Rsyx0WJVO2daeP++xR5WbIVMqX4Qn5I
	WdIDbb20qRomEkaQHaFq8d6NH5m6Mk6kK/Lfl2mn7GzdZ3KV/6rgfB0R7k+A/Q5nwzaIA0RUfo=
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id af79cd13be357-932df726607mr772541685a.51.1785140683543;
        Mon, 27 Jul 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id
 af79cd13be357-932df726607mr772538785a.51.1785140683104; Mon, 27 Jul 2026
 01:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com> <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
In-Reply-To: <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:24:32 +0200
X-Gm-Features: AUfX_myV0_Wl_14C6MR4VP26q2WPb3N04NR3JSuL1c_UODALCQ3qxRW1JtxJA8Q
Message-ID: <CAFEp6-1Rciv1qqsYeHLnxKPKXos+hP3FUkgRjXzrTzHDA5cMDg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gy8CmXDmpnLMHAwVIcI2K1FDmbY7QQOr
X-Proofpoint-GUID: gy8CmXDmpnLMHAwVIcI2K1FDmbY7QQOr
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a6715d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=1AaZgIuxyIDxt6-OCucA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfX7E3OXBjEuYU6
 qbHulcHtGuwTwyQDgQ60Yu6seHrxltk+JF2KiyHxfLgcrk3IUgDhxfLewls4lkIKzl95valN1FK
 RJXsA9OBJJXuKCHMcKXn989TKV0ritD/xoNkmB82OAGOeTV1oqZWaZQQB49vS8IneHF4OVclOWu
 iTrnHn+gS+aOhOZIeeRJKhyL4jtEMp5GgGPfyLrX7vFxXVN2dUL1ItVbVzKpnDVGe5qrHYRcb18
 AvBmMNknGbo4Mnoq0lFqCskU8qqSIGH/UJtdvKdl9pnz4EzGpOEoBQyfKDDs18BXmPRuYh0JI0R
 XAywFwOJMhGioVYzQfEIcJmno0XI3LQjaP1Bl36A6kOFeKrOkZjViGUqAxTok4CWF2+8Jar2b3U
 3rSlv+n0rcbxb0TiW2ZebPLptC6PC+NPsiR/OR44LyXzLI3YOga1viZw381P9MhUf7Kpaw/mTMf
 58OuHIXoL5bpY+OI33Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfXwpwxkcycNfbU
 q6yHr/i8CV9aZq1L0UNVJX5AdLE6vFNpBjA91oXS6OvVba+3zJVi1021u5bNYgEwPdjvsxXup+f
 bkpXStFdl4Qsdc43lGZsjeuJ69kSf58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270082

Hi Krzysztof,

On Mon, Jul 27, 2026 at 8:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 09:48:16AM +0200, Loic Poulain wrote:
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
> >            properties:
> >              reg:
> >                maximum: 3
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 3
> >    - if:
> >        properties:
> >          compatible:
> > @@ -96,10 +136,16 @@ allOf:
> >                - nxp,pca9634
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
>
> Why changing this? multi-led is below, so maybe you wanted to combine
> both?

Yes, I wanted to combine them so that both multi-led@ and led@ nodes
have their reg property checked by this filter, while the multi-led@
filter below only checks the reg property of its led@ subnodes, though
it may not very clear and also too permissive?
>
> >            properties:
> >              reg:
> >                maximum: 7
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 7
> >
> >  additionalProperties: false
> >
> > @@ -143,4 +189,50 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@62 {
> > +            compatible =3D "nxp,pca9633";
> > +            reg =3D <0x62>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            /* Three channels controlling one RGB LED */
> > +            multi-led@0 {
> > +                    reg =3D <0>;
>
> Messed indentation.

ack.

> > +                    color =3D <LED_COLOR_ID_RGB>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    led@0 {
> > +                            reg =3D <0>;
> > +                            color =3D <LED_COLOR_ID_RED>;
> > +                    };
> > +
> > +                    led@1 {
> > +                            reg =3D <1>;
> > +                            color =3D <LED_COLOR_ID_GREEN>;
> > +                    };
> > +
> > +                    led@2 {
> > +                            reg =3D <2>;
> > +                            color =3D <LED_COLOR_ID_BLUE>;
> > +                    };
> > +            };
> > +
> > +            /* Remaining channel used as a plain white LED */
> > +            led@3 {
> > +                    reg =3D <3>;
> > +                    color =3D <LED_COLOR_ID_WHITE>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +            };
> > +        };
> > +    };
> > +
> >  ...
> >
> > --
> > 2.34.1
> >
