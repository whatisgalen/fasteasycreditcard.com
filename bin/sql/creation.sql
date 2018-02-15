CREATE TABLE credit_cards_(
    card_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    corp character varying(50) NOT NULL,
    cardName character varying(50) NOT NULL,
    minCreditScore integer NOT NULL DEFAULT 1,
    aprMin real NOT NULL DEFAULT 0,
    aprMax real NOT NULL DEFAULT 0,
    bonusSpend integer NOT NULL DEFAULT 0,
    bonusPeriod integer NOT NULL DEFAULT 0,
    bonusPoints integer NOT NULL DEFAULT 0,
    spendCat1 character varying(50),
    spendCat1Reward real NOT NULL DEFAULT 0,
    spendCat1Earnings real NOT NULL DEFAULT 0,
    spendCat2 character varying(50),
    spendCat2Reward real NOT NULL DEFAULT 0,
    spendCat2Earnings real NOT NULL DEFAULT 0,
    spendCat3 character varying(50),
    spendCat3Reward real NOT NULL DEFAULT 0,
    spendCat3Earnings real NOT NULL DEFAULT 0,
    defaultReward real NOT NULL DEFAULT 0,
    defaultEarnings real NOT NULL DEFAULT 0,
    bigPurchaseEarnings real NOT NULL DEFAULT 0,
    totalEarnings real NOT NULL DEFAULT 0,
    freeFinance integer NOT NULL DEFAULT 0,
    annualFee integer NOT NULL DEFAULT 0,
    annualFeeDelay integer NOT NULL DEFAULT 0,
    international boolean NOT NULL DEFAULT FALSE,
    notes character varying(250),
    url character varying(250)
);

CREATE TABLE users_(
    user_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    creditScore integer NOT NULL DEFAULT 1,
    spendCat1 character varying(50),
    spendCat1Amount integer NOT NULL DEFAULT 0,
    spendCat2 character varying(50),
    spendCat2Amount integer NOT NULL DEFAULT 0,
    spendCat3 character varying(50),
    spendCat3Amount integer NOT NULL DEFAULT 0,
    bigPurchaseCat character varying(50),
    bigPurchaseAmount integer NOT NULL DEFAULT 0
    
);

-- ALTER TABLE public.credit_cards_
--    ADD COLUMN "minCreditScore" integer NOT NULL DEFAULT 1;