Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77242D77B
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440687; cv=none; b=dzDdXvtm/8xraFW7z97c1Cs0rthg6422HCpub/MhPevGJrwLJa3if7SW9pDlIS0Q6iy8iNSCV4puv2xKYlOFzuopNHpdorjwDX+3ScFirAdkEtpA6gpWSC8D/JZiBqXBsqOpSow7K8NA3RherYLwbZSVhYB+RnSLMD3/h2efSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440687; c=relaxed/simple;
	bh=8QXwmcpvLOgS2HJEcrVuGl3PSKJiGBxtH2I13j0yeZA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iikAJiVjLFx/4cX9bLZwiwOXo/05SogZ09KPpcqo5tNrzd5IQrS5BNyNATlbBBc1CDxyrwedHb9hkfQe7uf/P7EZE3uFGxr8pcg9+slUdZmKjgFWvNwzE2jaQrFYOOIHGTmroaj7BBqKvHTjNd3X2ypVwzU2Inr9SCIZ3SjQ3Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyk18MWH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyk18MWH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d004f135b1so7378675ad.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440685; x=1787045485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=lyk18MWH3cpWuRrJa34S3ofIqp+Sfl4k2izTx9zDN4o0Tkx5V5kKXyAaUtxyKP7nf/
         KSZlWbU2ZcxU3Uy8AmbXgYuUn5aK6HLDqyKrJROXvzwzgxlaEOphmZyR6InS+5JKd1uL
         0mAyD2NfhFMEP8Jc/UdIh8LH0dcZwMIoI5vwFCjZW24bXZZ6znSVF6b8peNarhZ00Hng
         J3o21LzWuQfo0IZcF6FqG9zCSBl5Z2lCYz0Hk/IROCNaA9QdiouqkQfEwgtHLNl1OJ8m
         MjswBXSo45pACCZnkKE0DpHtOGexSZIvbZdBcHyg2PDBDUx7ao9nFLI0Vl4q/TGh7Gw4
         1aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440685; x=1787045485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=NSCdvOS7VfFkrh2Ryhb4N2U4avTr2j+cxwPkbb8xArlHJplGxFtghIuwPk0Z32Io/F
         neJzD6d/yCW6UVojUdn1YMpONtrqkI3n8Yp6izQ7xG/y35UgFawtU0WEGYRWHyYoEtcp
         qWhZwAbrSg5mmJyisPgloYuS6/5NYBoBCNWr4sFUJMi0jSUR1OS1LU6xGxCZ+dSO73+B
         W5zXKc3deN3PZqYDGL3bZE879DYKDIENlUBvXG4CPAeax5qUXQVq16uZnBRVV/v326iy
         Mye2b64i1ldburVt0IdWYjLr1rjIQLQpaG3F3MqpjEz5ZsRxHAVSFfAUir7+9n1XQf4F
         D/dQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIb5c+H0vv2g48rWplHVRtuTwW5lqTBFKZblgNwG8FaCzx1ftV5+tpfeRFDkZ0YefiXue8IgBMI/fQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8oGwi0qgS6hgB5NHEuqcu4KCMnoE5JM9ZZJZmZsA94K+WRSg/
	g/M7CcU0tfOwRk8soznApL/fjanVqbEVy2YKPwtrHD5O5qbgIJ2gjEkY
X-Gm-Gg: AR+sD114oXXE09khOn0ui0JkaX4vBCvMpRMzH0Z/5oEbICK0yp0oir4e31WzBpPc18c
	xwcjdChOnkFddqEKGvaC8gZF1qgdBuvL3YuNmT1f3V+K85yez0gHYe32bauMEKuJuBHUTPSUAqZ
	SRnCW4TkhxK/TAuSWkm433D8fga2vmV9i7z++gJVa2yyH+w6hL5b50VLdv0bubXnTgMzMQCI5fV
	Ci3RBOUMZFapc8h68vJb/YyXgFGH93MNDBCFbeyHexhCQp2YQRmXj+w0LfhcLSJpFnbGt10cQlU
	gczmI5r4LTSd4RfDpCK8Z7ws1RgWyxfMzC5ehPzc49na9k8ldfKWKo6SO0Y/ZKGb+u4X7b39dO5
	RmbX4LSydWe517X1B1RdnpwcPFC8ZXD/8ZCzX6OYaEMuWmSlAgNoOQ9cton54+gZ38n3W4Scfh9
	UMKq2yPpTe8PuCm40nLEE8GA4yfVNlhl/cKsfowgUtSdGZvYTPdoiwztflp7cJxhNIvTkGdS8ia
	XFuqr5HqTLju3/YCDgf3vq0jhI6z8LaRbt7AfGELTU=
X-Received: by 2002:a17:903:944:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d31792b495mr25426375ad.15.1786440684729;
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f3f33csm4781325ad.26.2026.08.11.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Message-ID: <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
Date: Tue, 11 Aug 2026 02:31:22 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+guptarud.gmail.com@kernel.org
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 conor.dooley@microchip.com, david@ixit.cz, devicetree@vger.kernel.org,
 guptarud@gmail.com, konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, lee@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, phone-devel@vger.kernel.org,
 robh@kernel.org
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com/#t

This series seems to have fallen in between the cracks. Should I resend 
this patch series?


Thanks,

Rudraksha

